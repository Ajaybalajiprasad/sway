#!/bin/bash

# Power Menu Script for Rofi
# Place this at ~/.config/rofi/scripts/power-menu.sh
# Make it executable: chmod +x ~/.config/rofi/scripts/power-menu.sh

# Options
shutdown="⏻ shutdown"
reboot="🔄 reboot"
lock="🔒 lock"
suspend="⏸️  suspend"
logout="🚪 logout"
cancel="❌ cancel"

# Show rofi menu
chosen=$(echo -e "$shutdown\n$reboot\n$lock\n$suspend\n$logout\n$cancel" | rofi -dmenu -p "Power Menu:" -theme-str 'window {width: 20%;}')

case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        swaylock -f --config ~/.config/swaylock/config
        ;;
    $suspend)
        swaylock -f --config ~/.config/swaylock/config && systemctl suspend
        ;;
    $logout)
        swaymsg exit
        ;;
    $cancel)
        exit 0
        ;;
esac
