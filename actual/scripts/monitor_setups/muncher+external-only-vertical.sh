#!/bin/sh

xrandr --output eDP1 --off --output HDMI2 --primary --mode 1920x1080 --rotate left
bspc monitor HDMI2 -d 1 2 3 4 5 6
