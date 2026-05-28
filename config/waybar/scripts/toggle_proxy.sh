#!/bin/env bash

CONNECTION_ID="014f647a-2b55-4958-9006-21afa7b7aaf5"
CONNECTION_NAME="OpenVPN"

print_status() {
    if nmcli -f UUID,STATE connection show | grep "$CONNECTION_ID" | grep -q "activating"; then
        echo "{\"alt\": \"activating\", \"text\": \"Proxy\", \"class\": \"proxy-activating\", \"tooltip\": \"Activating: $CONNECTION_NAME\nUUID: $CONNECTION_ID\"}"
        pkill -RTMIN+1 waybar
    elif nmcli connection show --active | grep -q "$CONNECTION_ID"; then
        notify-send "Proxy activated" "Connected: $CONNECTION_NAME\nUUID: $CONNECTION_ID"
        echo "{\"alt\": \"on\", \"text\": \"Proxy\", \"class\": \"proxy-on\", \"tooltip\": \"Connected: $CONNECTION_NAME\nUUID: $CONNECTION_ID\"}"
    else
        notify-send "Proxy deactivated" "Disconnected: $CONNECTION_NAME\nUUID: $CONNECTION_ID"
        echo "{\"alt\": \"off\", \"text\": \"Proxy\", \"class\": \"proxy-off\", \"tooltip\": \"Disconnected\"}"
    fi
}

if [[ "$1" == "toggle" ]]; then
    if nmcli connection show --active | grep -q "$CONNECTION_ID"; then
        nmcli connection down "$CONNECTION_ID" > /dev/null &
    else
        notify-send "Proxy is activating" "Activating: $CONNECTION_NAME\nUUID: $CONNECTION_ID"
        nmcli connection up "$CONNECTION_ID" > /dev/null &
    fi
    pkill -RTMIN+1 waybar
else
    print_status
fi
