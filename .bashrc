#
# ~/.bashrc
#

export EDITOR="nvim"
export VISUAL="nvim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -lh'
PS1='[\u@\h \W]\$ '
alias fzf='$EDITOR "$(\fzf)"'
alias cfg='/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME'
alias v='nvim'
alias tr='trash'

export FZF_DEFAULT_COMMAND="find -L"
export PATH="/home/ripytide/scripts/:$PATH"

export FZF_DEFAULT_OPTS='
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
  --preview="bat --color=always {}"
'
colorscript random
