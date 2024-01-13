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
	config = function(_, opts)
		require("telescope").setup(opts)
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
				"node_modules",
				"Cargo.lock",
				"target",
				".git",
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
					"-g",
					"!**/.git/*",
					"-g",
					"!**/package-lock.json",
					"-g",
					"!**/*.svg",
					"-g",
					"!**/node_modules/*",
					"-g",
					"!**/libs/*",
					"-g",
					"!**/Cargo.lock",
					"-g",
					"!**/venv/",
				},
			},
			live_grep = {
				additional_args = {
					"-g",
					"!**/.git/*",
					"-g",
					"!**/package-lock.json",
					"-g",
					"!**/*.svg",
					"-g",
					"!**/node_modules/*",
					"-g",
					"!**/libs/*",
					"-g",
					"!**/Cargo.lock",
					"-g",
					"!**/venv/",
				},
			},
		},
	},
}
