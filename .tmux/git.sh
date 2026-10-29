#!/bin/zsh
# tmux status pill for the active pane's directory ($1): branch icon + name,
# in a green pill when the tree is clean, yellow when dirty, then ↑ahead ↓behind its upstream.
# Prints nothing outside a git repo.
export LC_ALL=en_US.UTF-8
source ${0:A:h}/pill.zsh
cd -q -- "$1" 2>/dev/null || exit 0
st=$(git --no-optional-locks status --porcelain=v2 --branch 2>/dev/null) || exit 0

dirty= ahead=0 behind=0
for line in ${(f)st}; do
  case $line in
    '# branch.oid '*)  oid=${line#\# branch.oid } ;;
    '# branch.head '*) head=${line#\# branch.head } ;;
    '# branch.ab '*)   ab=(${=line#\# branch.ab }); ahead=${ab[1]#+}; behind=${ab[2]#-} ;;
    '#'*) ;;
    *) dirty=1 ;;
  esac
done
[[ $head == '(detached)' ]] && head=${oid[1,7]}
(( ${#head} > 24 )) && head="${head[1,23]}…"

[[ -n $dirty ]] && colour='#e6c384' || colour='#98bb6c'   # yellow dirty / green clean
text=$head
(( ahead ))  && text+=" ↑${ahead}"
(( behind )) && text+=" ↓${behind}"
solid $colour '' "$text"
