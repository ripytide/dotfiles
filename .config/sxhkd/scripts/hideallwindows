#! /bin/bash

if bspc query -N -n any.hidden
then
	for i in $(bspc query -N -n .hidden)
	do
		bspc node $i -g hidden=off
	done
else
	for i in $(bspc query -N)
	do
		bspc node $i -g hidden=on
	done
fi
