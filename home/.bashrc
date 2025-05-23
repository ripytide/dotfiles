#! /bin/sh

#
# ~/.bashrc
#

export EDITOR="nvim"
export VISUAL="nvim"
export PATH="/home/ripytide/.cargo/bin/:/home/ripytide/scripts/:/home/ripytide/.local/bin/:$PATH"
export MANPAGER="nvim +Man!"
export TERM="kitty"
export PAGER="bat"
export SYSTEMD_PAGER="bat -l syslog -p"
export SYSTEMD_COLORS="false"
export SYSTEMD_PAGERSECURE="true"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# Dark Mode
export GTK_THEME="Adwaita:dark"
export GTK2_RC_FILES="/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc"
export QT_STYLE_OVERRIDE="Adwaita-Dark"

# source export-esp.sh

krabby random

exec nu
