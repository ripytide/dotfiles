return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = false,
				severity_sort = true,
			},
			-- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
			-- Be aware that you also will need to properly configure your LSP server to
			-- provide the inlay hints.
			inlay_hints = {
				enabled = false,
			},
			servers = {
				rust_analyzer = {
					cmd = { "rust-analyzer" },
					keys = {
						{ "K", false },
					},
					settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = false },
							checkOnSave = { allFeatures = false },
							lens = {
								enable = false,
							},
						},
					},
				},
			},
		},
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			-- change a keymap
			keys[#keys + 1] = { "gy", vim.lsp.buf.hover }
			-- disable a keymap
			keys[#keys + 1] = { "K", false }
			-- add a keymap
			keys[#keys + 1] = { "gt", vim.lsp.buf.type_definition }
			keys[#keys + 1] = { "gi", vim.lsp.buf.implementation }
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		opts = {
			tools = {
				inlay_hints = {
					auto = false,
				},
			},
		},
	},
}
