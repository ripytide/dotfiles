$env.TRANSIENT_PROMPT_COMMAND = "> "

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

mkdir ~/.cache/zoxide
zoxide init nushell --cmd n | save -f ~/.cache/zoxide/zoxide.nu
