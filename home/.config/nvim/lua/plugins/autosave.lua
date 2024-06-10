return {
	"Pocco81/auto-save.nvim",
	opts = {
		execution_message = {
			message = function()
				return ""
			end,
			dim = 0.18,
			cleaning_interval = 1250,
		},
		-- function that determines whether to save the current buffer or not
		-- return true: if buffer is ok to be saved
		-- return false: if it's not ok to be saved
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")

			local modifiable = fn.getbufvar(buf, "&modifiable") == 1
			local filetype = fn.getbufvar(buf, "&filetype")
			local ignored_filetypes = utils.not_in(filetype, { "oil", "octo" })

			if modifiable and ignored_filetypes then
				return true -- met condition(s), can save
			end
			return false -- can't save
		end,
	},
}
