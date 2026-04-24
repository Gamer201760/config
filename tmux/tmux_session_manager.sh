#!/bin/bash

ta() {
    tmux display-popup -C \; switch-client -t "$1"
}

local sessions new_session
sessions=$( (tmux ls -F '#S' 2>/dev/null; echo "[new session]") | fzf --prompt="Select session or create new: ")  || return
if [[ $sessions == "[new session]" ]]
then
        echo -n "Enter new session name: "
        read new_session
        if [[ -n $new_session ]]
        then
                tmux new -d -s $new_session
                ta $new_session
        fi
else
        ta $sessions
fi

