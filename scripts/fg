#!/bin/bash

FILE=$(rg "$@" | fzf --border=rounded | awk -F : '{print $1}')

if [ ! $FILE ]; then
    exit 1
fi

$EDITOR $FILE
