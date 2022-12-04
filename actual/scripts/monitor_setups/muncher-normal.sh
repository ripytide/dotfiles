#!/bin/sh

xrandr --output eDP1 --mode 1920x1080 --rotate normal --output HDMI2 --off
bspc monitor eDP1 -d 1 2 3 4 5 6
