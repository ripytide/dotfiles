return {
	"folke/flash.nvim",
	opts = {
		highlight = {
			backdrop = false,
		},
		modes = {
			search = {
				enabled = false,
			},
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
			"Q",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}
