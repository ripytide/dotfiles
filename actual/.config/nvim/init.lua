local function src(name)
	vim.cmd("source " .. "~/.config/nvim/vim/" .. name)
end

src("generic.vim")
src("plugins.vim")
src("new-coc.vim")
src("bindings.vim")
src("telescope.vim")
src("neovide.vim")
require("leap_config")
require("tree-sitter")
require("zoxide")

--my old flame ;(
--colorscheme gruvbox
vim.cmd.colorscheme("tokyonight-night")
