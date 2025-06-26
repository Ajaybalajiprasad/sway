#!/bin/bash

# Start swayidle to turn off the screen after 1 second
swayidle \
    timeout 1 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

# Lock the screen immediately
swaylock -C ~/.config/swaylock/config

# Kill the swayidle process after unlocking
kill %1

