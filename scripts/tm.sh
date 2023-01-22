#!/bin/bash

# Quick script for switching tmux sessions using fzf

OUTPUT="$(tmux ls | awk {'print $1'} | tr ":" " " | sed s/\ // | fzf --border)"

# Handle entering Ctrl+c and exiting out -- don't try to open a tmux session with that
if [ ! $OUTPUT ]; then
    exit 1
fi

tmux a -t $OUTPUT



