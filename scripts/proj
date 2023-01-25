#!/bin/bash

# Script for finding .git directories in our ~/proj folder, piping that into fzf for search/selection,
# and opening that directory as a new tmux session with that as the name and pwd.

# this command will run realpath on the git directory up 1 level to get to the actual project directory.
# that result is then piped through fzf
OUTPUT="$(find $HOME/proj -maxdepth 3 -name '.git' -exec realpath {}/../ \; | fzf --border=rounded)"

# Handle entering Ctrl+c and exiting out -- don't try to open a tmux session with that
if [ ! $OUTPUT ]; then
    exit 1
fi

# we use the base name as the tmux session name
BASE="$(basename $OUTPUT)"

# try to attach to a session with this name, if that fails create a new session
tmux a -t $BASE || tmux new -c $OUTPUT -s $BASE
