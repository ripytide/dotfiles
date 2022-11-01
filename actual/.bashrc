#! /bin/sh

#
# ~/.bashrc
#

export EDITOR="nvim"
export VISUAL="nvim"
export PATH="/home/ripytide/.cargo/bin/:/home/ripytide/scripts/:/home/ripytide/.local/bin/:$PATH"
export SSH_AUTH_LOCK=$(gpgconf --list-dirs agent-ssh-socket)

colorscript random

exec fish
