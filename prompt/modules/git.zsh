# Git pill. The branch is read straight from .git/HEAD (instant, no fork); counts and
# dirty state come from an async `git status` that redraws the prompt when it lands.
# Last-known state per repo is cached, so re-entering a repo shows it immediately.
# Sets: _p_git (pill markup or empty)

typeset -g _p_fd= _p_git_branch=
typeset -gA _p_git_cache   # root → "ahead behind staged modified untracked conflict"

_p_git_head() {
  local gd=$_p_root/.git line
  if [[ -f $gd ]]; then
    read -r line < $gd; gd=${line#gitdir: }
    [[ $gd == /* ]] || gd=$_p_root/$gd
  fi
  [[ -r $gd/HEAD ]] || { _p_git_branch=; return }
  read -r line < $gd/HEAD
  if [[ $line == 'ref: refs/heads/'* ]]; then _p_git_branch=${line#ref: refs/heads/}
  else _p_git_branch=${line[1,7]}; fi
  (( ${#_p_git_branch} > 24 )) && _p_git_branch="${_p_git_branch[1,23]}…"
}

# Runs in a background subshell; prints one \x1f-separated line.
_p_git_status() {
  local st line a=0 b=0 s=0 m=0 u=0 c=0
  st=$(cd -q -- $1 2>/dev/null && git --no-optional-locks status --porcelain=v2 --branch 2>/dev/null) || return
  for line in ${(f)st}; do
    case $line[1] in
      '#') if [[ $line == '# branch.ab '* ]]; then
             local -a ab=(${=line#\# branch.ab }); a=${ab[1]#+}; b=${ab[2]#-}
           fi ;;
      1|2) [[ ${line[3]} != . ]] && (( s++ )); [[ ${line[4]} != . ]] && (( m++ )) ;;
      u)   (( c++ )) ;;
      '?') (( u++ )) ;;
    esac
  done
  print -r -- "$a $b $s $m $u $c"
}

_p_git_cb() {
  local fd=$1 line
  if [[ -z $2 || $2 == hup ]]; then read -r -u $fd line; fi
  zle -F $fd; exec {fd}<&-
  [[ $fd == $_p_fd ]] || return        # stale result
  _p_fd=
  [[ -n $line && -n $_p_root ]] || return
  _p_git_cache[$_p_root]=$line
  (( _p_transient )) && return
  _p_render
  zle && zle reset-prompt
}

_p_git_refresh() {
  if [[ -n $_p_fd ]]; then zle -F $_p_fd 2>/dev/null; exec {_p_fd}<&-; _p_fd=; fi
  [[ -n $_p_root ]] || return
  exec {_p_fd}< <(_p_git_status $_p_root)
  zle -F $_p_fd _p_git_cb
}

_p_mod_git() {
  REPLY=
  [[ -n $_p_root ]] || return
  _p_git_head
  [[ -n $_p_git_branch ]] || return
  local -a f=(${=_p_git_cache[$_p_root]})
  local colour=${_P[blue]} txt=$_p_git_branch
  if (( ${#f} )); then
    if   (( f[6] ));                    then colour=${_P[red]}
    elif (( f[3] + f[4] + f[5] ));      then colour=${_P[yellow]}
    else colour=${_P[green]}; fi
    (( f[1] )) && txt+=" ↑${f[1]}"
    (( f[2] )) && txt+=" ↓${f[2]}"
    (( f[3] )) && txt+=" +${f[3]}"
    (( f[4] )) && txt+=" !${f[4]}"
    (( f[5] )) && txt+=" ?${f[5]}"
    (( f[6] )) && txt+=" ✖${f[6]}"
  fi
  _p_esc $txt
  _p_solid $colour ${_I[branch]} $REPLY
}
