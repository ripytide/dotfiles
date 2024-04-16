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
			servers = {
				rust_analyzer = {
					mason = false,
				},
				typos_lsp = {
					mason = false,
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
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
		opts = {
			tools = {
				hover_actions = {
					replace_builtin_hover = false,
				},
			},
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>cR", function()
						vim.cmd.RustLsp("codeAction")
					end, { desc = "Code Action", buffer = bufnr })
					vim.keymap.set("n", "<leader>dr", function()
						vim.cmd.RustLsp("debuggables")
					end, { desc = "Rust Debuggables", buffer = bufnr })
				end,
				keys = {
					{ "K", false },
				},
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						check = {
							workspace = true,
							command = "clippy",
							-- features = "all",
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
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
		end,
	},
}
