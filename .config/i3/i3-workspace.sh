#!/bin/bash
# Obtiene el nombre del monitor donde está el foco actual
MONITOR=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).output')

# El primer argumento ($1) será el número de workspace (1, 2, 3...)
# El nombre final será algo como "HDMI-1:1" o "eDP-1:1"
i3-msg "workspace \"$MONITOR:$1\""

