#! /bin/sh

#
# ~/.bashrc
#

export EDITOR="nvim"
export VISUAL="nvim"
export PATH="/home/ripytide/.cargo/bin/:/home/ripytide/scripts/:/home/ripytide/.local/bin/:$PATH"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

exec fish
