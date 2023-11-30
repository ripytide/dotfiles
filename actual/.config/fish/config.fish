bind \t accept-autosuggestion
bind -k btab complete

starship init fish | source

zoxide init fish --cmd n | source

# Disable the fish greeting message
set fish_greeting
