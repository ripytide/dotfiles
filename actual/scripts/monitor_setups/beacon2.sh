#!/bin/sh

xrandr --output DP1 --mode 1920x1080 --pos 1080x634 --rotate normal --output HDMI3 --primary --mode 1920x1080 --pos 0x0 --rotate left
bspc monitor HDMI3 -d 1 2 3
bspc monitor DP1 -d 4 5 6
