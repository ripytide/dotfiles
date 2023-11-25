require("catppuccin").setup({
	flavour = "macchiato",
	styles = {             -- Handles the styles of general hi groups (see `:h highlight-args`):
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
	color_overrides = { macchiato = { base = "#1F1F28" } }
})

--my old flames ;(
--vim.cmd.colorscheme("gruvbox")
--vim.cmd.colorscheme("blue")
--vim.cmd.colorscheme("tokyonight-storm")
--vim.cmd.colorscheme("kanagawa")
vim.cmd.colorscheme("catppuccin")

vim.cmd("hi Search guibg=black guifg=red")
vim.cmd("hi CurSearch guibg=black guifg=blue")
vim.cmd("hi IncSearch guibg=green guifg=black")

local signs = {Error = "", Warn = "", Hint = "󰌵", Info = ""}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
local vim_diagnostic_config = {
    virtual_text = false,
    signs = {active = signs},
    update_in_insert = true,
    severity_sort = true,
    float = {
        focusable = false,
        border = "single",
        source = "always",
        header = "",
        prefix = ""
    }
}
vim.diagnostic.config(vim_diagnostic_config)
