#!/bin/zsh
# Claude Code ⇄ tmux status.
#   claude.sh hook          Claude Code hook (JSON on stdin) → records this pane's state
#   claude.sh seen WINDOW   tmux hook: you looked at WINDOW, so turn its done/error marks back to idle
#   claude.sh summary SESS  status-right: Claude activity in sessions other than SESS
#
# Pane option @claude_state = idle | working | waiting | done | error (unset = no Claude here).
# Window option @claude     = the most urgent state among the window's panes;
# window-status-format draws an icon from it.
export LC_ALL=en_US.UTF-8
source ${0:A:h}/pill.zsh

rank() { case $1 in waiting) print 5;; error) print 4;; working) print 3;; done) print 2;; idle) print 1;; *) print 0;; esac }

# Recompute the window-level state from its panes and redraw every client's status.
sync_window() {
  local win=$1 best= s
  for s in ${(f)"$(tmux list-panes -t "$win" -F '#{@claude_state}')"}; do
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
    case $event in
      SessionStart)      state=idle ;;
      UserPromptSubmit|PostToolUse) state=working ;;
      PreToolUse)        [[ $tool == (AskUserQuestion|ExitPlanMode) ]] && state=waiting || state=working ;;
      PermissionRequest) state=waiting ;;
      Stop|StopFailure)
        [[ $event == StopFailure ]] && state=error || state=done
        want=$state   # notify on the real outcome, even if the marker is suppressed below
        # already looking at this window? then there's nothing new to flag
        [[ $state == done && $(tmux display -p -t "$TMUX_PANE" '#{window_active}#{session_attached}') == 1[1-9]* ]] && state=idle ;;
      SessionEnd)        state= ;;
      *) exit 0 ;;
    esac
    prev=$(tmux display -p -t "$TMUX_PANE" '#{@claude_state}')
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
    typeset -A n
    for s in ${(f)"$(tmux list-panes -a -F '#{session_id} #{@claude_state}')"}; do
      [[ ${s%% *} == $2 || -z ${s#* } ]] && continue   # this session, or no Claude
      (( n[${s#* }]++ ))
    done
    # other sessions' Claude activity: red pill = waiting on you, orange = working
    (( n[waiting] )) && solid '#e46876' '' "${n[waiting]}"
    (( n[working] )) && solid '#d97757' '✻' "${n[working]}"
    ;;
esac
exit 0
