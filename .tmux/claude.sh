#!/bin/zsh
# Claude Code ⇄ tmux status.
#   claude.sh hook          Claude Code hook (JSON on stdin) → records this pane's state
#   claude.sh seen WINDOW   tmux hook: you looked at WINDOW, so turn its done/error marks back to idle
#   claude.sh summary SESS  status-right: Claude activity in sessions other than SESS
#
# Pane option @claude_state = idle | working | waiting | done | error (unset = no Claude here).
# Pane option @claude_subs  = running subagents (SubagentStart/Stop); while >0 the pane stays "working".
# Window option @claude     = the most urgent state among the window's panes;
# window-status-format draws an icon from it.
export LC_ALL=en_US.UTF-8
source ${0:A:h}/pill.zsh

rank() { case $1 in waiting) print 5;; error) print 4;; working) print 3;; done) print 2;; idle) print 1;; *) print 0;; esac }

# Recompute the window-level state from its panes and redraw every client's status.
sync_window() {
  local win=$1 best= s line
  for line in ${(f)"$(tmux list-panes -t "$win" -F '#{@claude_state}')"}; do
    s=$line
    (( $(rank "$s") > $(rank "$best") )) && best=$s
  done
  if [[ -n $best ]]; then tmux set -w -t "$win" @claude "$best"; else tmux set -wu -t "$win" @claude; fi
  for c in ${(f)"$(tmux list-clients -F '#{client_name}')"}; do tmux refresh-client -t "$c" -S; done
}

# macOS notification when Claude wants you but you can't see it: the pane's window
# isn't the active one, or no focused client is showing its session.
notify() {
  local pane=$1 state=$2 sess line visible=
  sess=$(tmux display -p -t "$pane" '#{session_name}')
  [[ $(tmux display -p -t "$pane" '#{window_active}') == 1 ]] && for line in ${(f)"$(tmux list-clients -F '#{client_session} #{client_flags}')"}; do
    [[ ${line%% *} == $sess && ${line#* } == *focused* ]] && visible=1
  done
  [[ -n $visible ]] && return
  local msg sound
  case $state in
    waiting) msg='Needs your input'; sound=Ping ;;
    done)    msg='Finished';         sound= ;;
    error)   msg='Hit an error';     sound=Basso ;;
  esac
  osascript -e 'on run argv' \
            -e 'if (item 3 of argv) is "" then' \
            -e 'display notification (item 2 of argv) with title (item 1 of argv)' \
            -e 'else' \
            -e 'display notification (item 2 of argv) with title (item 1 of argv) sound name (item 3 of argv)' \
            -e 'end if' -e 'end run' -- "Claude · $sess" "$msg" "$sound" >/dev/null 2>&1 &!
}

case $1 in
  hook)
    [[ -n $TMUX_PANE ]] || exit 0
    json=$(</dev/stdin)
    [[ $json =~ '"hook_event_name" *: *"([^"]+)"' ]] && event=$match[1]
    [[ $json =~ '"tool_name" *: *"([^"]+)"' ]] && tool=$match[1]
    [[ $json =~ '"notification_type" *: *"([^"]+)"' ]] && ntype=$match[1]
    subs=$(tmux display -p -t "$TMUX_PANE" '#{@claude_subs}')
    [[ $subs == <-> ]] || subs=0
    case $event in
      SessionStart)      state=idle; subs=0 ;;
      # subagent events only adjust the count; they never start a turn, so a stray one can't wedge the pane at "working"
      SubagentStart)     (( subs++ )); state=$(tmux display -p -t "$TMUX_PANE" '#{@claude_state}') ;;
      SubagentStop)
        (( subs > 0 )) && (( subs-- ))
        # last subagent finished after the parent already stopped: resolve the deferred outcome
        if (( subs == 0 )); then
          state=$(tmux display -p -t "$TMUX_PANE" '#{@claude_deferred}')
          if [[ -n $state ]]; then want=$state
          else state=$(tmux display -p -t "$TMUX_PANE" '#{@claude_state}'); fi   # no deferred stop: leave as is
        else state=$(tmux display -p -t "$TMUX_PANE" '#{@claude_state}'); fi ;;
      UserPromptSubmit|PostToolUse) state=working ;;
      PreToolUse)        [[ $tool == (AskUserQuestion|ExitPlanMode) ]] && state=waiting || state=working ;;
      PermissionRequest) state=waiting ;;
      Stop|StopFailure)
        [[ $event == StopFailure ]] && state=error || state=done
        want=$state   # notify on the real outcome, even if the marker is suppressed below
        if (( subs > 0 )); then   # subagents still running: the session isn't finished
          tmux set -p -t "$TMUX_PANE" @claude_deferred "$state"
          want= state=working
        else
          # already looking at this window? then there's nothing new to flag
          [[ $state == done && $(tmux display -p -t "$TMUX_PANE" '#{window_active}#{session_attached}') == 1[1-9]* ]] && state=idle
        fi ;;
      Notification)
        case $ntype in
          permission_prompt|elicitation_dialog) state=waiting ;;
          # Claude sat idle awaiting you: flag it as done unless it's already idle/seen
          idle_prompt) (( subs > 0 )) && exit 0   # waiting on subagents, not on you
                       [[ $(tmux display -p -t "$TMUX_PANE" '#{@claude_state}') == working ]] && state=done || exit 0 ;;
          *) exit 0 ;;
        esac ;;
      SessionEnd)        state= subs=0 ;;
      *) exit 0 ;;
    esac
    prev=$(tmux display -p -t "$TMUX_PANE" '#{@claude_state}')
    # a new turn or the resolved outcome clears any deferred stop
    if [[ $event == (UserPromptSubmit|SessionStart|SessionEnd) || ($event == SubagentStop && $subs == 0) ]]; then
      tmux set -pu -t "$TMUX_PANE" @claude_deferred
    fi
    if (( subs )); then tmux set -p -t "$TMUX_PANE" @claude_subs "$subs"; else tmux set -pu -t "$TMUX_PANE" @claude_subs; fi
    if [[ -n $state ]]; then tmux set -p -t "$TMUX_PANE" @claude_state "$state"
    else tmux set -pu -t "$TMUX_PANE" @claude_state; fi
    sync_window "$TMUX_PANE"
    want=${want:-$state}
    [[ $want == (waiting|done|error) && $want != $prev ]] && notify "$TMUX_PANE" "$want" ;;

  seen)
    [[ -n $2 ]] || exit 0
    changed=
    for line in ${(f)"$(tmux list-panes -t "$2" -F '#{pane_id} #{@claude_state}')"}; do
      [[ ${line#* } == (done|error) ]] && { tmux set -p -t "${line%% *}" @claude_state idle; changed=1 }
    done
    [[ -n $changed ]] && sync_window "$2" ;;

  summary)
    # Other sessions' Claude activity, one pill per state, in priority order, each listing
    # the projects (session names) in that state. Idle is a quiet grey count.
    typeset -A names cnt
    local line sid name st
    for line in ${(f)"$(tmux list-windows -a -F '#{session_id}'$'\t''#{session_name}'$'\t''#{@claude}')"}; do
      sid=${line%%$'\t'*} name=${line#*$'\t'}
      st=${name##*$'\t'} name=${name%$'\t'*}
      [[ $sid == $2 || -z $st ]] && continue   # this session, or no Claude
      [[ " ${names[$st]} " == *" ${name// /_} "* ]] && continue   # one entry per session per state
      names[$st]+=" ${name// /_}"
      (( cnt[$st]++ ))
    done
    local -a list
    local state icon colour n shown=0 extra=0 max=5
    for state icon colour in waiting $'\uF0F3' '#e46876'  error $'\uF071' '#7e9cd8'  done $'\uF00C' '#98bb6c'  working '✻' '#d97757'; do
      list=(${=names[$state]})
      for n in $list; do   # one pill per project, most urgent first
        if (( shown < max )); then solid "$colour" "$icon" "${${n//_/ }:0:24}"; (( shown++ )); else (( extra++ )); fi
      done
    done
    (( extra )) && pill '#727169' '' "+$extra"
    (( cnt[idle] )) && pill '#727169' '✻' "${cnt[idle]}"
    ;;
esac
exit 0
