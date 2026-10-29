#!/bin/zsh
# tmux status pill: a blue pill with a box + count while Docker containers are running;
# nothing otherwise (daemon down or idle).
# (Box glyph, not the whale: the whale is wide and renders tiny in a Mono Nerd Font.)
export LC_ALL=en_US.UTF-8
source ${0:A:h}/pill.zsh
ids=$(docker ps -q 2>/dev/null) || exit 0
running=(${(f)ids})
(( ${#running} )) && solid '#7e9cd8' $'\U000F03D7' "${#running}"   # md-package_variant_closed
exit 0
