#!/bin/bash

TARGET=$(cat $HOME/.ssh/config | grep -i -G "Host\ " | awk '{print $2}' | fzf --border=rounded)

if [ ! $TARGET ]; then
    exit 1
fi

ssh $TARGET
