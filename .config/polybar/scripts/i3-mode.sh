#!/usr/bin/env bash

# Περίμενε μέχρι να είναι έτοιμο το i3 socket
for i in {1..20}; do
    SOCK=$(i3 --get-socketpath 2>/dev/null)
    if [ -n "$SOCK" ] && [ -S "$SOCK" ]; then
        export I3SOCK="$SOCK"
        break
    fi
    sleep 0.1
done

# Αν δεν υπάρχει socket, φύγε ήσυχα
[ -z "$I3SOCK" ] && exit 0

format_output() {
    local mode="$1"

    if [ "$mode" = "default" ]; then
        echo ""
    else
        # κόκκινο + bold + icon
        echo "%{B#ff0000}%{F#ffffff}%{T1}  $mode %{T-}%{F-}%{B-}"
    fi
}

# Δείξε current mode στην αρχή
i3-msg -t get_binding_state | jq -r '.name' | while read -r mode; do
    format_output "$mode"
done

# Παρακολούθησε αλλαγές
i3-msg -t subscribe '[ "mode" ]' | jq -r '.change' | while read -r mode; do
    format_output "$mode"
done
