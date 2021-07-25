#! /bin/sh
replacements=replacements.toml
input=.config
output=~/.config

if [[ -e $output ]]; then
	rm -rf $output
	mkdir $output
fi

cp -r $input/* $output

./replacer.py $replacements $output
