#!/usr/bin/env bash

for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Core 0" ]; then
        export HWMON_PATH="$i"
    fi
done

# Terminate already running bar instances
killall polybar

sleep 2;

# Launch polybar
polybar main -c ~/.config/polybar/config.ini &
