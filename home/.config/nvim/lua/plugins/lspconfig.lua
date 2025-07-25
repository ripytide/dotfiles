return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = {
				enabled = false,
			},
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = false,
				severity_sort = true,
			},
			servers = {
				tailwindcss = {
					filetypes = { "rust" },
					settings = {
						tailwindCSS = {
							-- https://github.com/tailwindlabs/tailwindcss/discussions/7073
							includeLanguages = {
								rust = "html",
							},
							experimental = {
								classRegex = { 'class\\s*:\\s*"([^"]*)' },
							},
						},
					},
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			keys[#keys + 1] = { "gy", vim.lsp.buf.hover }
			keys[#keys + 1] = { "gt", vim.lsp.buf.type_definition }
			keys[#keys + 1] = { "gi", vim.lsp.buf.implementation }
			keys[#keys + 1] = { "<C-k>", false, mode = { "i" } }
			keys[#keys + 1] = { "<C-s>", vim.lsp.buf.signature_help, mode = { "i" } }
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"tinymist",
				"typos-lsp",
				"bash-language-server",
				"clangd",
				"codelldb",
				"csharpier",
				"json-lsp",
				"lua-language-server",
				"markdown-toc",
				"markdownlint",
				"markdownlint-cli2",
				"marksman",
				"netcoredbg",
				"prettier",
				"pyright",
				"ruff",
				"shellcheck",
				"shfmt",
				"sqlfluff",
				"stylua",
				"tombi",
				"yaml-language-server",
				"tailwindcss-language-server",
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		ft = { "rust" },
		opts = {
			tools = {
				hover_actions = {
					replace_builtin_hover = false,
				},
			},
			server = {
				keys = {
					{ "K", false },
					{ "gy", false },
				},
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						check = {
							workspace = true,
							command = "clippy",
							features = "all",
						},
						references = {
							excludeImports = true,
						},
						lens = {
							enable = false,
						},
					},
				},
			},
		},
	},
}
