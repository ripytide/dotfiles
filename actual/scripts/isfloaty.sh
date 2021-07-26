#! /bin/bash
pseudo=$(bspc query -N -n focused.pseudo_tiled)
floating=$(bspc query -N -n focused.floating)

if [[ -n $pseudo || -n $floating ]]
then
	echo "yes"
else
	echo "no"
fi
