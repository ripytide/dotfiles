require("bufferline").setup {
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and "" or ""
			return icon .. count
		end,
		max_name_length = 30
	}
}
