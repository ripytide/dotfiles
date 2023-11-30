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

vim.cmd("hi Search guibg=black guifg=red")
vim.cmd("hi CurSearch guibg=black guifg=blue")
vim.cmd("hi IncSearch guibg=green guifg=black")

vim.cmd("hi FlashMatch guibg=black guifg=red")
vim.cmd("hi FlashCurrent guibg=black guifg=blue")
vim.cmd("hi FlashBackdrop guibg=green guifg=black")
vim.cmd("hi FlashLabel guibg=black guifg=green")
