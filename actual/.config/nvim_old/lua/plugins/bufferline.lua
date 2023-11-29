return {
	'akinsho/bufferline.nvim',
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").config({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, _, _)
					local icon = level:match("error") and "" or ""
					return icon .. count
				end,
				max_name_length = 30
			}
		})
	end
}
