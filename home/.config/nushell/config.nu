$env.config = {
	show_banner: false,
	display_errors: {
		exit_code: false,
	}
	keybindings: [
		{
            modifier: control
            keycode: char_j
            mode: [emacs]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
		},
		{
            modifier: control
            keycode: char_k
            mode: [emacs]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
		},
	]
}

if $nu.os-info.name == "windows" {
} else {
	$env.TERM = "kitty"
	$env.SSH_AUTH_SOCK = (gpgconf --list-dirs agent-ssh-socket)

	$env.PATH = (
		$env.PATH
			| split row (char esep)
			| append /home/ripytide/.cargo/bin
			| append /home/ripytide/scripts
			| append /home/ripytide/.local/bin
			| uniq
	)
}

$env.TRANSIENT_PROMPT_COMMAND = "> "
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.MANPAGER = "nvim +Man!"
$env.PAGER = "bat"
$env.SYSTEMD_PAGER = "bat -l syslog -p"
$env.SYSTEMD_COLORS = "false"
$env.SYSTEMD_PAGERSECURE = "true"

# Dark Mode
$env.GTK_THEME = "Adwaita:dark"
$env.GTK2_RC_FILES = "/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc"
$env.QT_STYLE_OVERRIDE = "Adwaita-Dark"

alias ll = ls -l
alias la = ls -al
alias rg = rg --smart-case

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
use ~/.cache/starship/init.nu

mkdir ~/.cache/zoxide
zoxide init nushell --cmd n | save -f ~/.cache/zoxide/zoxide.nu
source ~/.cache/zoxide/zoxide.nu

krabby random -i
