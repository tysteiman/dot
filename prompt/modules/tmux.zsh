# tmux awareness: one `tmux display` per prompt gives the session name (so the dir module
# can drop a redundant project pill) and this pane's Claude state (set by ~/.tmux/claude.sh).
# Sets: _p_sess, _p_claude (pill markup or empty)

_p_mod_tmux() {
  _p_sess= _p_claude=
  [[ -n $TMUX ]] || return
  local out; out=$(tmux display -p -t "$TMUX_PANE" $'#{session_name}\x1f#{@claude_state}' 2>/dev/null) || return
  local -a f=("${(@ps:\x1f:)out}")
  _p_sess=${f[1]}
  local c i
  case ${f[2]} in
    waiting) c=${_P[red]}    i=${_I[bell]} ;;
    error)   c=${_P[blue]}   i=${_I[warn]} ;;
    working) c=${_P[orange]} i=${_I[claude]} ;;
    done)    c=${_P[green]}  i=${_I[check]} ;;
    idle)    c=${_P[gray]}   i=${_I[claude]} ;;
    *) return ;;
  esac
  _p_pill $c $i claude $c; _p_claude=$REPLY
}
