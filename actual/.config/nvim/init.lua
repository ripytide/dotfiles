local function src(name)
	vim.cmd("source " .. "~/.config/nvim/vim/" .. name)
end

-- core stuff
src("generic.vim")
src("plugins.vim")
require("bindings")
--src("neovide.vim")

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
