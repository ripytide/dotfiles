require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		refresh = { statusline = 100 }
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = {
			"diff",
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				sections = { "error", "warn" }
			},
		},
		lualine_x = { "ruler", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {}
}
