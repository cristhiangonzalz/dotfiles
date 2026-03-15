#!/bin/bash
# 1. Obtiene el monitor donde NO está el foco (el destino)
DESTINO=$(i3-msg -t get_outputs | jq -r '.[] | select(.active==true and .focused==false).name')

# 2. Mueve la ventana al workspace con el mismo número pero en el otro monitor
# Si estás en el 1, la manda al "OTRO_MONITOR:1"
i3-msg "move container to workspace \"$DESTINO:$1\""

