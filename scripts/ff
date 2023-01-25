#!/bin/bash

FILE=$(git ls-files | fzf --border=rounded)

if [ ! $FILE ]; then
    exit 1
fi

$EDITOR $FILE
