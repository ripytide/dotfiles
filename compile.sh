#! /bin/sh
input=~/dotfiles/actual/.
output=~

cp -r $input $output

~/dotfiles/replacer.py "$1".toml $output
