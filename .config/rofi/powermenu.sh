#!/bin/bash

option=$(echo -e "🔒 Bloquear\n🚪 Salir\n🔄 Reiniciar\n⏻ Apagar" | rofi -dmenu -i -p "Sistema")

case "$option" in
    "🔒 Bloquear")
        i3lock
        ;;
    "🚪 Salir")
        loginctl terminate-session $XDG_SESSION_ID
        ;;
    "🔄 Reiniciar")
        systemctl reboot
        ;;
    "⏻ Apagar")
        systemctl poweroff
        ;;
esac
