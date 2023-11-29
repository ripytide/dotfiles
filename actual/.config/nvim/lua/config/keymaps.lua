-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>k", require("telescope.builtin").keymaps)
vim.keymap.set("n", "<C-d>", "16jzz")
vim.keymap.set("n", "<C-u>", "16kzz")

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.keymap.set("n", "n", diagnostic_goto(true), {desc = "Jump to next diagnostic message"})
vim.keymap.set("n", "N", diagnostic_goto(false), {desc = "Jump to previous diagnostic message"})
vim.keymap.set("n", "_", "N", {desc = "Jump to previous search result"})
vim.keymap.set("n", ",", "n", {desc = "Jump to next search result"})

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>jk", { desc = "Escape and clear hlsearch" })
