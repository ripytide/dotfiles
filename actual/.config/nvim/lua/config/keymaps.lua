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

vim.keymap.set("n", "n", diagnostic_goto(true))
vim.keymap.set("n", "N", diagnostic_goto(false))
vim.keymap.set("n", "_", "N")
vim.keymap.set("n", ",", "n")
