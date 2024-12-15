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
			preset = "default",
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active({ direction = 1 }) then
						return cmp.snippet_forward()
					elseif cmp.is_visible() then
						return cmp.select_next()
					elseif has_words_before() then
						return cmp.accept()
					else
						return false
					end
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					if cmp.snippet_active({ direction = -1 }) then
						return cmp.snippet_backward()
					elseif cmp.is_visible() then
						return cmp.select_prev()
					else
						return false
					end
				end,
				"fallback",
			},
		},
		completion = {
			list = {
				selection = "auto_insert",
			},
			menu = {
				border = "rounded",
			},
		},
	},
}
