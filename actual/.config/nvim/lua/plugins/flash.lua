return {
	"folke/flash.nvim",
	opts = {
		modes = {
			char = {
				multi_line = false,
				highlight = { backdrop = false },
				search = { wrap = false },
			},
		},
	},
	keys = {
		{ "s", false },
		{ "S", false },
		{
			"q",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"Q",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
	},
}
