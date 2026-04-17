#!/bin/env bash

CONNECTION_ID="014f647a-2b55-4958-9006-21afa7b7aaf5"
CONNECTION_NAME="OpenVPN"

# Функция для вывода статуса
print_status() {
    if nmcli connection show --active | grep -q "$CONNECTION_ID"; then
        echo "{\"alt\": \"on\", \"text\": \"Proxy\", \"class\": \"proxy-on\", \"tooltip\": \"Connected: $CONNECTION_NAME\nUUID: $CONNECTION_ID\"}"
    else
        echo "{\"alt\": \"off\", \"text\": \"Proxy\", \"class\": \"proxy-off\", \"tooltip\": \"Disconnected\"}"
    fi
}

# Если передан аргумент "toggle" (нажатие в Waybar)
if [[ "$1" == "toggle" ]]; then
    if nmcli connection show --active | grep -q "$CONNECTION_ID"; then
        nmcli connection down "$CONNECTION_ID" > /dev/null
    else
        nmcli connection up "$CONNECTION_ID" > /dev/null
    fi
    # Отправляем сигнал Waybar обновить модуль (RTMIN+10 соответствует signal: 10)
    pkill -RTMIN+1 waybar
else
    # Если запущен без аргумента (первый запуск Waybar)
    print_status
fi
