-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false

vim.o.hidden = false

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

vim.api.nvim_set_option("clipboard", "unnamed")

vim.o.undodir = "/home/ripytide/undodir"
vim.o.swapfile = false
vim.o.backup = false

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    border = "single",
    source = "always",
    header = "",
    prefix = "",
  },
})

