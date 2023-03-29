local function src(name)
	vim.cmd("source " .. "~/.config/nvim/vim/" .. name)
end

src("generic.vim")
src("plugins.vim")
src("bindings.vim")
--src("neovide.vim")
require("telescope_config")
require("leap_config")
require("tree-sitter")
require("bufferline_config")
require("lualine_config")
require("mason_config")
require("rust_tools_config")
require("cmp_config")

--my old flame ;(
--colorscheme gruvbox
vim.cmd.colorscheme("tokyonight-night")
vim.cmd("hi Search guibg=black guifg=red")
vim.cmd("hi CurSearch guibg=black guifg=blue")
vim.cmd("hi IncSearch guibg=green guifg=black")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd(
	'BufWrite',
	{
		pattern = '*.scm',
		callback = function ()
			require'nvim-treesitter.query'.invalidate_query_cache()
		end
	}
)
