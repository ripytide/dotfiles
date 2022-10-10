#!/bin/sh

xrandr --output HDMI3 --primary --mode 1920x1080 --pos 0x0 --rotate normal
bspc monitor HDMI3 -d 1 2 3 4 5 6
