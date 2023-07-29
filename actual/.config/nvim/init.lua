local function src(name)
	vim.cmd("source " .. "~/.config/nvim/vim/" .. name)
end

src("generic.vim")
src("plugins.vim")
src("bindings.vim")
--src("neovide.vim")

require("telescope_config")
require("rainbow_delimiters_config")
require("leap_config")
require("tree-sitter")
require("bufferline_config")
require("lualine_config")
require("lsp_config")
require("cmp_config")
require("dashboard_config")

require("catppuccin").setup({
	flavour = "macchiato",
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = { "bold" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = { "bold" },
	},
	color_overrides = {macchiato = {base = "#1F1F28"}}
})

--my old flame ;(
--vim.cmd.colorscheme("gruvbox")
--vim.cmd.colorscheme("blue")
--vim.cmd.colorscheme("tokyonight-storm")
--vim.cmd.colorscheme("kanagawa")
vim.cmd.colorscheme("catppuccin")

vim.cmd("hi Search guibg=black guifg=red")
vim.cmd("hi CurSearch guibg=black guifg=blue")
vim.cmd("hi IncSearch guibg=green guifg=black")

require("dressing").setup({
	input = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-k>"] = false
			}
		}
	}
})

vim.g.vimtex_quickfix_open_on_warning = 0
