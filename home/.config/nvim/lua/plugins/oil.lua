return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			keymaps = {
				["<esc>"] = "actions.parent",
				["q"] = function()
					require("oil").save({ confirm = false })
					require("oil").close()
				end,
				["Q"] = function()
					require("oil").close()
				end,
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>e",
				function()
					require("oil").open_float(vim.fn.getcwd())
				end,
				desc = "Open Oil in parent directory",
			},
		},
	},
}
