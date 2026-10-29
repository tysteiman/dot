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
        # already looking at this window? then there's nothing new to flag
        [[ $state == done && $(tmux display -p -t "$TMUX_PANE" '#{window_active}#{session_attached}') == 1[1-9]* ]] && state=idle ;;
      SessionEnd)        state= ;;
      *) exit 0 ;;
    esac
    if [[ -n $state ]]; then tmux set -p -t "$TMUX_PANE" @claude_state "$state"
    else tmux set -pu -t "$TMUX_PANE" @claude_state; fi
    sync_window "$TMUX_PANE" ;;

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
    out=
    (( n[waiting] )) && out+="#[fg=#e46876]"$''" ${n[waiting]} "
    (( n[working] )) && out+="#[fg=#e6c384]✻ ${n[working]} "
    [[ -n $out ]] && print -rn -- "$out "
    ;;
esac
exit 0
