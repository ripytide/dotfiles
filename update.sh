#! /bin/bash

sudo pacman -Syu --color
#curl https://raw.githubusercontent.com/ripytide/dotfiles/main/packages.txt -o ~/dotfiles/packages.txt
yay -S --noconfirm --needed - < ~/dotfiles/packages.txt
