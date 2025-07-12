-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<C-d>", "16jzz")
-- vim.keymap.set("n", "<C-u>", "16kzz")

vim.keymap.set("n", "n", function() vim.diagnostic.jump({count=1, float=true}) end, { desc = "Jump to next diagnostic message" })
vim.keymap.set("n", "N", function() vim.diagnostic.jump({count=-1, float=true}) end, { desc = "Jump to previous diagnostic message" })
vim.keymap.set("n", "_", "N", { desc = "Jump to previous search result" })
vim.keymap.set("n", ",", "n", { desc = "Jump to next search result" })

vim.keymap.set("n", "p", "p`[", { desc = "Paste without moving the cursor" })
vim.keymap.set("n", "P", "P`[", { desc = "Paste without moving the cursor" })

vim.keymap.set("x", "p", "P", { desc = "Paste without overwriting the buffer" })

local substitute_config = { register = "" }
vim.keymap.set("n", "s", function() require("substitute").operator(substitute_config) end, { noremap = true })
vim.keymap.set("n", "ss", function() require("substitute").line(substitute_config) end, { noremap = true })
vim.keymap.set("n", "S", function() require("substitute").eol(substitute_config) end, { noremap = true })
vim.keymap.set("x", "s", function() require("substitute").visual(substitute_config) end, { noremap = true })

vim.keymap.del("n", "<leader>gG")
vim.keymap.set("n", "<leader>gg", require("lazy").show, { desc = "Open lazy.nvim" })
vim.keymap.set("n", "<leader>l", function() require("snacks").lazygit.open() end, { desc = "LazyGit" })

vim.keymap.set("n", ";n", "A,<esc>")
vim.keymap.set("n", ";t", "A;<esc>")

vim.keymap.set("n", "<leader><leader>", require("fzf-lua").files)
vim.keymap.set("n", "<leader>/", require("fzf-lua").live_grep)

vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "gl", vim.lsp.buf.rename)
vim.keymap.set("n", "0", "^")

vim.keymap.set("i", "<C-e>", "<End>", { noremap = true })
vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Esc>lDa", { noremap = true })
