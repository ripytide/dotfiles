#! /bin/sh
mkdir -p $tmp/home/ripytide/dotfiles/actual

cp -r ~/dotfiles/actual/. /home/ripytide/dotfiles/actual

find ~/dotfiles/actual -type f -print0 | xargs -0 -I _ envsubst < _ | sponge _

#rm -rf $tmp
