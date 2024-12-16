return {
	"nvim-lualine/lualine.nvim",
	opts = {
		sections = {
			lualine_b = { "diff", "diagnostics" },
			lualine_c = {
				{ "filename", file_status = true, path = 2 },
			},
		},
	},
}
