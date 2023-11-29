require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed =
	{
		"rust", "lua", "html", "vim", "javascript", "typescript",
		"toml", "yaml", "json", "python", "tsx", "svelte", "sql",
		"regex", "nix", "markdown", "markdown_inline", "bash", "latex", "ini", "http",
		"gitignore", "fish"
	},
}
