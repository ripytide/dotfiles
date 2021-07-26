#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybars
polybar main -c ~/.config/polybar/config.ini &
polybar left -c ~/.config/polybar/config.ini &
polybar right -c ~/.config/polybar/config.ini &

sleep 1
xdo raise -N Polybar
