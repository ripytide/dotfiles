use ~/.cache/starship/init.nu

source ~/.cache/zoxide/zoxide.nu

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

krabby random -i
