#!/bin/sh

xrandr --output DP1-8 --primary --mode 1920x1080 --pos 0x0 --rotate normal
bspc monitor DP1-8 -d 1 2 3 4 5 6
