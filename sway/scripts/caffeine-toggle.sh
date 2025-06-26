#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════════════════╗
# ║                          CAFFEINE TOGGLE SCRIPT                             ║
# ║                Save as ~/.config/sway/scripts/caffeine-toggle.sh             ║
# ║                        chmod +x the script after saving                     ║
# ╚══════════════════════════════════════════════════════════════════════════════╝

CAFFEINE_FILE="/tmp/caffeine_active"

if [ -f "$CAFFEINE_FILE" ]; then
    # Caffeine is active, turn it off
    rm "$CAFFEINE_FILE"
    
    # Re-enable swayidle to lock screen automatically
    pkill swayidle
    exec swayidle -w \
        timeout 300 'if pgrep -x swaylock; then exit 0; fi; \
                     if playerctl status 2>/dev/null | grep -q Playing; then exit 0; fi; \
                     if pgrep -f "meet.google.com\|zoom\|teams\|discord\|slack" >/dev/null; then exit 0; fi; \
                     swaylock -f --config ~/.config/swaylock/config' \
        timeout 600 'if pgrep -x swaylock; then exit 0; fi; \
                     if playerctl status 2>/dev/null | grep -q Playing; then exit 0; fi; \
                     if pgrep -f "meet.google.com\|zoom\|teams\|discord\|slack" >/dev/null; then exit 0; fi; \
                     swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
        before-sleep 'swaylock -f --config ~/.config/swaylock/config' &
    
    # Notify and update caffeine status
    notify-send "☕ Caffeine OFF" "Screen will lock normally" -t 3000
    echo "off" > "$CAFFEINE_FILE"
    # Update Waybar Caffeine Status
    swaymsg "run 'waybar-msg caffeine off'"
else
    # Caffeine is not active, turn it on
    touch "$CAFFEINE_FILE"
    
    # Kill swayidle to prevent screen locking
    pkill swayidle
    
    # Notify and update caffeine status
    notify-send "☕ Caffeine ON" "Screen will not lock automatically" -t 3000
    echo "on" > "$CAFFEINE_FILE"
    # Update Waybar Caffeine Status
    swaymsg "run 'waybar-msg caffeine on'"
fi
