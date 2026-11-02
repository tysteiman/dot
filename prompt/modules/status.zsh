# Exit status, command duration, prompt character (+ vi-mode).
# Sets: _p_status (pills), _p_char (prompt glyph markup)

zmodload -F zsh/datetime p:EPOCHREALTIME
typeset -g _p_start=

_p_preexec() { _p_start=$EPOCHREALTIME }

_p_fmt_dur() {
  local -i s=$1
  if   (( s >= 3600 )); then REPLY="$((s/3600))h $((s%3600/60))m"
  elif (( s >= 60 ));   then REPLY="$((s/60))m $((s%60))s"
  else REPLY="${s}s"; fi
}

_p_mod_status() {
  local rc=$1
  _p_status=
  if (( rc )); then
    _p_solid ${_P[red]} ${_I[fail]} $rc; _p_status+=$REPLY
  fi
  if [[ -n $_p_start ]]; then
    local -F d=$(( EPOCHREALTIME - _p_start ))
    _p_start=
    if (( d >= 3 )); then
      _p_fmt_dur ${d%.*}; _p_pill ${_P[yellow]} ${_I[clock]} $REPLY; _p_status+=$REPLY
    fi
  fi
  _p_rc=$rc
}

# ❯ green/red by last exit status; ❮ yellow in vi normal mode
_p_mod_char() {
  if [[ $_p_keymap == vicmd ]]; then _p_char="%F{${_P[yellow]}}❮%f"
  elif (( _p_rc )); then _p_char="%F{${_P[red]}}❯%f"
  else _p_char="%F{${_P[green]}}❯%f"; fi
}
