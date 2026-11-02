# Project / directory pill.
# Always a solid blue pill (matching the tmux session pill). Inside a git repo it reads
# project/sub/path, where project is the repo root's name (the name tproj uses for sessions).
# Sets: _p_root (git root or empty), _p_project, _p_rel

_p_find_root() {
  local d=$PWD
  _p_root=
  while [[ -n $d && $d != / ]]; do
    [[ -e $d/.git ]] && { _p_root=$d; return }
    d=${d:h}
  done
}

# last three path components, "…/" if truncated
_p_shorten() {
  local -a parts=(${(s:/:)1})
  if (( ${#parts} > 3 )); then
    REPLY="…/${(j:/:)parts[-3,-1]}"
    [[ ${parts[1]} == '~' ]] && REPLY="~/$REPLY"
  else
    REPLY=$1
  fi
}

_p_mod_dir() {
  local txt
  if [[ -n $_p_root ]]; then
    local rel=${PWD#$_p_root}; rel=${rel#/}
    [[ -n $rel ]] && { _p_shorten $rel; rel=$REPLY }
    txt=${_p_root:t}${rel:+/$rel}
  else
    _p_shorten ${PWD/#$HOME/~}; txt=$REPLY
  fi
  _p_esc $txt
  _p_solid ${_P[blue]} ${_I[folder]} $REPLY   # solid blue, same as the tmux session pill
}
