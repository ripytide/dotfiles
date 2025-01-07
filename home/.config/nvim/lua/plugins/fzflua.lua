return {
	"ibhagwan/fzf-lua",
	opts = {
		-- todo uncomment when skim supports windows
		-- fzf_bin = "sk",
		file_ignore_patterns = {
			"Cargo%.lock",
			"COPYING",
			"%.aig$",
			"%.dgr$",
			"%.png$",
			"%.jpg$",
			"%.svg$",
			"%.jpeg$",
			"node_modules/",
			"node_modules\\",
			"target/",
			"target\\",
			"%.git/",
			"%.git\\",
		},
		defaults = {
			header = false,
		},
		actions = {
			files = {
				["default"] = require("fzf-lua").actions.file_edit,
				["ctrl-q"] = {
					fn = function(selected, opts)
						opts.copen = false
						require("fzf-lua").actions.file_sel_to_qf(selected, opts)
						vim.cmd(".cc")
					end,
					prefix = "select-all+",
				},
			},
		},
		winopts = {
			fullscreen = true,
			preview = {
				horizontal = "right:40%",
			},
		},
		keymap = {
			builtin = {},
			fzf = {
				["tab"] = "up",
				["btab"] = "down",
				["up"] = "toggle+up",
				["down"] = "toggle+down",
				["ctrl-o"] = "toggle",
			},
		},
		fzf_opts = {
			["--header"] = "",
			["--layout"] = "default",
		},
		files = {
			fd_opts = [[--type file --hidden --follow --color=never]],
		},
		grep = {
			rg_opts = "--smart-case --hidden --follow --column --line-number --no-heading --color=always --max-columns=4096 -e",
		},
	},
}
