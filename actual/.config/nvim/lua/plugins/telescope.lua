return {
	"nvim-telescope/telescope.nvim",
	opts = {
		defaults = {
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
					["<C-u>"] = false,
					["<C-q>"] = require("telescope.actions").send_to_qflist,
				},
				n = {
					["<C-q>"] = require("telescope.actions").send_to_qflist,
				},
			},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
			},
			file_ignore_patterns = {
				"node_modules",
				".git",
			},
			layout_config = {
				width = 500,
				height = 500,
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},
}
