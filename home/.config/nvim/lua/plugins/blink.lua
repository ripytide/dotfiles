local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	"saghen/blink.cmp",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = {
				"snippet_forward",
				"select_next",
				function(cmp)
					if has_words_before() then
						return cmp.accept()
					else
						return false
					end
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				"snippet_backward",
				"select_prev",
				"fallback",
			},
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			menu = {
				border = "rounded",
			},
		},
		sources = {
			cmdline = function()
				local type = vim.fn.getcmdtype()
				-- Search forward and backward
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				-- Commands
				if type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
		},
	},
}
