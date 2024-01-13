-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false

vim.opt.hidden = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.undodir = "/home/ripytide/undodir"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.mouse = ""
vim.opt.scrolloff = 8
vim.opt.textwidth = 80

vim.cmd("hi Search guibg=black guifg=red")
vim.cmd("hi CurSearch guibg=black guifg=blue")
vim.cmd("hi IncSearch guibg=green guifg=black")
vim.cmd("hi FlashCursor guibg=black guifg=orange")

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
