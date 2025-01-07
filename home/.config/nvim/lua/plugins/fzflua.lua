return {
	"ibhagwan/fzf-lua",
	opts = {
		-- todo uncomment when skim supports windows
		-- fzf_bin = "sk",
		file_ignore_patterns = { "-E %.git/ -E node_modules/ -E target/ -E %.lock$ -E COPYING" },
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
				["tab"] = "down",
				["btab"] = "up",
				["up"] = "toggle+up",
				["down"] = "toggle+down",
				["ctrl-o"] = "toggle",
			},
		},
		fzf_opts = {},
		files = {
			fd_opts = [[--type file --hidden --follow --color=never]],
		},
		grep = {
			rg_opts = "--smart-case --hidden --follow --column --line-number --no-heading --color=always --max-columns=4096 -e",
		},
	},
}
