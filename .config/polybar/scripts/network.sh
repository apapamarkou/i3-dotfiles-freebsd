#!/bin/sh

# 1. Find the active interface routing internet traffic
ACTIVE_IFACE=$(netstat -rn | awk '/default/ {print $4; exit}')

# --- State: Completely Offline ---
if [ -z "$ACTIVE_IFACE" ]; then
    echo "󰲛" # NerdFont: nf-md-wifi_off (No network)
    exit 0
fi

# --- State: Loopback/Testing Only (No real external interface) ---
if [ "$ACTIVE_IFACE" = "lo0" ]; then
    echo "󰪑" # NerdFont: nf-md-alert_circle_outline
    exit 0
fi

# Fetch configuration details for the active interface
IFCONFIG_DATA=$(ifconfig "$ACTIVE_IFACE" 2>/dev/null)

# --- State: Wi-Fi Connected ---
if echo "$ACTIVE_IFACE" | grep -q "^wlan" || echo "$IFCONFIG_DATA" | grep -q "ssid"; then
    echo "󰖩" # NerdFont: nf-md-wifi (Wi-Fi connected)
    exit 0
fi

# --- State: Ethernet Connected ---
if echo "$IFCONFIG_DATA" | grep -qE "status: (active|running)"; then
    echo "󰈀" # NerdFont: nf-md-ethernet (Ethernet connected)
    exit 0
fi

# --- Fallback State: Interface exists but has no active link ---
echo "󰲛"
