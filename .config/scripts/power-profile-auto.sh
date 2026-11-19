#!/usr/bin/env bash

# Auto switch power-profiles-daemon profiles based on AC adapter state
# Requires: power-profiles-daemon, systemd

AC_PATH="/sys/class/power_supply/ACAD/online"

set_profile() {
    case "$1" in
        "1") # AC connected
            powerprofilesctl set performance
            ;;
        "0") # AC disconnected
            powerprofilesctl set balanced
            ;;
    esac
}

if [[ -f "$AC_PATH" ]]; then
    AC_STATE=$(cat "$AC_PATH")
    set_profile "$AC_STATE"
else
    echo "⚠️ Adapter path not found: $AC_PATH" | systemd-cat -t power-profile-auto -p warning
fi
