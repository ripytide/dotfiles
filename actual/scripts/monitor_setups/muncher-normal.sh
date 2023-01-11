#!/bin/sh
#
xrandr --output eDP1 --mode 1920x1080 --rotate normal --primary --output HDMI2 --off

# necceccary as you always need at least one desktop on every monitor
# for some reason
bspc monitor HDMI2 -a FakeHDMI2
bspc monitor eDP1 -a FakeDP1

bspc desktop one -m eDP1
bspc desktop two -m eDP1
bspc desktop three -m eDP1
bspc desktop four -m eDP1
bspc desktop five -m eDP1
bspc desktop six -m eDP1
