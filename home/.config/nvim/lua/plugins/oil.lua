return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = { { "<leader>e", "<cmd>Oil<CR>", desc = "Open parent directory" } },
	},
}
