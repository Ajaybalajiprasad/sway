#!/bin/bash

# Function to get battery status
battery() {
    BAT=$(acpi -b | grep -v "unavailable" | cut -d',' -f2 | tr -d ' %')
    if [ -z "$BAT" ]; then
        echo "No BAT"
    else
        STATUS=$(acpi -b | grep -v "unavailable" | cut -d',' -f1 | cut -d':' -f2 | tr -d ' ')
        if [ "$STATUS" = "Charging" ]; then
            echo "BAT: $BAT%+"
        else
            echo "BAT: $BAT%"
        fi
    fi
}

# Function to get WiFi status
wifi() {
    WIFI_SSID=$(iwgetid -r)
    if [ -z "$WIFI_SSID" ]; then
        echo "WIFI: OFF"
    else
        WIFI_SIGNAL=$(grep "^\s*w" /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')
        echo "WIFI: $WIFI_SIGNAL%"
    fi
}

# Function to get volume
volume() {
    VOL=$(pactl list sinks | grep -A 15 "State: RUNNING" | grep "Volume:" | grep -o "[0-9]*%" | head -1 | tr -d '%')
    if [ -z "$VOL" ]; then
        VOL=$(pactl list sinks | grep "Volume:" | grep -o "[0-9]*%" | head -1 | tr -d '%')
    fi
    MUTE=$(pactl list sinks | grep -A 15 "State: RUNNING" | grep "Mute: yes")
    if [ -n "$MUTE" ]; then
        echo "VOL: MUTE"
    else
        echo "VOL: $VOL%"
    fi
}

# Function to get brightness
brightness() {
    if command -v light &> /dev/null; then
        BR=$(light | cut -d'.' -f1)
        echo "BRI: $BR%"
    else
        # Try to get brightness from /sys
        if [ -f /sys/class/backlight/*/brightness ] && [ -f /sys/class/backlight/*/max_brightness ]; then
            BR_CUR=$(cat /sys/class/backlight/*/brightness)
            BR_MAX=$(cat /sys/class/backlight/*/max_brightness)
            BR=$((BR_CUR * 100 / BR_MAX))
            echo "BRI: $BR%"
        else
            echo "BRI: N/A"
        fi
    fi
}

# Function to get load average
load() {
    LOAD=$(uptime | awk -F'[a-z]:' '{ print $2}' | tr -d ' ' | cut -d',' -f1)
    echo "LOAD: $LOAD"
}

# Function to get memory usage
memory() {
    MEM=$(free -m | awk '/Mem:/ {printf "%.1f%%", $3/$2*100}')
    echo "MEM: $MEM"
}

# Main loop
while true; do
    echo "$(memory) | $(load) | $(brightness) | $(volume) | $(wifi) | $(battery) | $(date +'%a %b %d %H:%M')"
    sleep 1
done
