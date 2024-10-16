-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

-- vim.keymap.set("n", "<C-d>", "16jzz")
-- vim.keymap.set("n", "<C-u>", "16kzz")

local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

vim.keymap.set("n", "n", diagnostic_goto(true), { desc = "Jump to next diagnostic message" })
vim.keymap.set("n", "N", diagnostic_goto(false), { desc = "Jump to previous diagnostic message" })
vim.keymap.set("n", "_", "N", { desc = "Jump to previous search result" })
vim.keymap.set("n", ",", "n", { desc = "Jump to next search result" })

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>jk", { desc = "Escape and clear hlsearch" })
vim.keymap.set("x", "p", function()
	return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })

local substitute_config = { register = "" }
vim.keymap.set("n", "s", function()
	require("substitute").operator(substitute_config)
end, { noremap = true })
vim.keymap.set("n", "ss", function()
	require("substitute").line(substitute_config)
end, { noremap = true })
vim.keymap.set("n", "S", function()
	require("substitute").eol(substitute_config)
end, { noremap = true })
vim.keymap.set("x", "s", function()
	require("substitute").visual(substitute_config)
end, { noremap = true })

vim.keymap.del("n", "<leader>gG")
vim.keymap.set("n", "<leader>gg", require("lazy").show, { desc = "Open lazy.nvim" })
vim.keymap.set("n", "<leader>l", function()
	Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

vim.keymap.set("n", ";n", "A,<esc>")
vim.keymap.set("n", ";t", "A;<esc>")

vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>/", require("telescope.builtin").live_grep)

vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "gl", vim.lsp.buf.rename)
vim.keymap.set("n", "0", "^")

vim.keymap.set("i", "<C-e>", "<End>", { noremap = true })
vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Esc>lDa", { noremap = true })
