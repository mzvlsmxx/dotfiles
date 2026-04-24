#!/usr/bin/env bash


# date=$(date)
# echo "{\"alt\": \"!\", \"text\": \"$date\", \"class\": \"test-class\", \"percentage\": 77, \"tooltip\": \"Test script\"}"
STATE_FILE="$HOME/.config/waybar/scripts/test-temp"

[[ ! -f "$STATE_FILE" ]] && echo "OFF" > "$STATE_FILE"

# Если запущен с аргументом "toggle", меняем состояние
if [[ "$1" == "toggle" ]]; then
    [[ $(< $STATE_FILE) == "ON" ]] && echo "OFF" > $STATE_FILE || echo "ON" > $STATE_FILE
    exit
fi

# Основной цикл вывода для Waybar
CONTENT=$(cat "$STATE_FILE")
echo "{\"alt\": \"test\", \"text\": \"$CONTENT\", \"class\": \"test-class\", \"tooltip\": \"Test script\"}"
