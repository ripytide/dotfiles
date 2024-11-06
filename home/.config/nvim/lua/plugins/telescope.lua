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
					["<C-q>"] = function(prompt_bufnr)
						require("telescope.actions").send_to_qflist(prompt_bufnr)
						vim.cmd(".cc")
					end,
				},
				n = {
					["<C-q>"] = function(prompt_bufnr)
						require("telescope.actions").send_to_qflist(prompt_bufnr)
						vim.cmd(".cc")
					end,
				},
			},
			file_ignore_patterns = {
				"Cargo.lock",
				"COPYING",
				"*.aig",
				"*.dgr",
				"*.png",
				"*.jpg",
				"*.svg",
				"*.jpeg",
				"node_modules/",
				"target/",
				".git/",
				"node_modules\\",
				"target\\",
				".git\\",
			},
			layout_config = {
				width = 500,
				height = 500,
			},
		},
		pickers = {
			find_files = {
				follow = true,
				find_command = {
					"rg",
					"--files",
					"--smart-case",
					"--hidden",
				},
			},
			live_grep = {
				additional_args = {
					"-L",
					"--smart-case",
					"--hidden",
				},
			},
		},
	},
}
