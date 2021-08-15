#! /bin/sh
replacements=~/dotfiles/replacements.toml
input=~/dotfiles/actual
output=~

cp -r $input/. $output

~/dotfiles/replacer.py $replacements $output
