#! /bin/sh
replacements=~/dotfiles/replacements.toml
input=~/dotfiles/actual
output=~

cp -r $input/. $output

./replacer.py $replacements $output
