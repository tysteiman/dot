#!/bin/zsh
# tmux status segment: a blue box + count while Docker containers are running;
# nothing otherwise (daemon down or idle).
# (Box glyph, not the whale: the whale is wide and renders tiny in a Mono Nerd Font.)
export LC_ALL=en_US.UTF-8
ids=$(docker ps -q 2>/dev/null) || exit 0
running=(${(f)ids})
(( ${#running} )) && print -rn -- "#[fg=#7e9cd8]"$'\U000F03D7'" ${#running}  "   # md-package_variant_closed
exit 0
