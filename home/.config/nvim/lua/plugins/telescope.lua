return {
	"telescope.nvim",
	dependencies = {
		{
			"debugloop/telescope-undo.nvim",
		},
		{
			"gbrlsnchs/telescope-lsp-handlers.nvim",
		},
	},
	init = function(_)
		require("telescope").load_extension("undo")
		require("telescope").load_extension("lsp_handlers")
	end,
	keys = { { "<leader>cu", "<cmd>Telescope undo<CR>", desc = "Telescope Undo History" } },
	opts = {
		defaults = {
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
					["<C-u>"] = false,
					["<C-k>"] = false,
					["<C-q>"] = require("telescope.actions").send_to_qflist,
				},
				n = {
					["<C-q>"] = require("telescope.actions").send_to_qflist,
				},
			},
			file_ignore_patterns = {
				"/node_modules/",
				"/target/",
				"Cargo.lock",
				".git/",
				"**.aig",
				"**.dgr",
				"**.png",
				"**.jpg",
				"**.svg",
				"**.jpeg",
				"COPYING",
			},
			layout_config = {
				width = 500,
				height = 500,
			},
		},
		pickers = {
			find_files = {
				find_command = {
					"rg",
					"--files",
					"--smart-case",
					"--hidden",
				},
			},
			live_grep = {
				additional_args = {
					"--smart-case",
					"--hidden",
				},
			},
		},
	},
}
