#!/bin/sh

xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --primary --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal
bspc monitor eDP1 -d 1 2 3
bspc monitor HDMI2 -d 4 5 6
