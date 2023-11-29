-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.g.hidden = false

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = false,
        border = "single",
        source = "always",
        header = "",
        prefix = ""
    }
})

vim.g.clipboard = "unnamed";
