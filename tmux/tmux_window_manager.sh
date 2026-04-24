#!/bin/bash
# Получаем список окон с их номерами и именами текущей сессии
windows=$(tmux list-windows -F '#I: #W')

# Выбираем окно через fzf
target=$(echo "$windows" | fzf --bind 'j:down,k:up,q:abort' --prompt="Select tmux window:") || exit 0

# Берем номер выбранного окна (до двоеточия)
target=${target%%:*}

# Переключаемся на выбранное окно
tmux select-window -t $target
