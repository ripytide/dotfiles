#! /bin/bash

if [ ! -s  ~/scripts/originals ]
then
	for FILE in /home/ripytide/wallpapers/*
	do
		echo $FILE >> ~/scripts/originals
	done
fi
PICK=$(shuf -n 1 ~/scripts/originals)
sed -i "\:$PICK:d" ~/scripts/originals
nitrogen "$PICK" --set-zoom-fill --head=$1
