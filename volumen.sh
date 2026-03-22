#!/bin/bash

# Función para obtener el volumen actual
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -n1
}

# Función para enviar la notificación
send_notification() {
    volume=$(get_volume)
    dunstify -a "Volumen" -u low -r 9993 -h int:value:"$volume" -i "audio-volume-high" "Volumen" "Nivel: $volume%" -t 1000
}

case $1 in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        send_notification
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        send_notification
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        dunstify -a "Volumen" -u low -r 9993 -i "audio-volume-muted" "Silencio" "Estado cambiado" -t 1000
        ;;
esac

