local function src(name)
	vim.cmd("source " .. "~/.config/nvim/vim/" .. name)
end

-- core stuff
src("generic.vim")
require("bindings")

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- lsp/ui stuff, things end in "_config" to avoid name collisions with
-- the plugins themselves
require("telescope_config")
require("tree_sitter_config")
require("bufferline_config")
require("lualine_config")
require("cmp_config")
require("lsp_config")
require("dashboard_config")
require("noice_config")
require("dressing_config")

-- misc stuff
--require("leap_config")
require("visuals")
require("crates_config")
require("rainbow_delimiters_config")
require("substitute_config")

