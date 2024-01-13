require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })

local function my_lsp_mappings(bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
	vim.keymap.set(
		"n",
		"<leader>f",
		function()
			vim.lsp.buf.format({ async = false })
		end,
		opts
	)

	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	--vim.keymap.set("n", "gbb", dap.toggle_breakpoint, opts)
	--vim.keymap.set("n", "gbc", dap.continue, opts)
	--vim.keymap.set("n", "gbs", dap.step_over, opts)
	--vim.keymap.set("n", "gbi", dap.step_into, opts)
	--vim.keymap.set("n", "gbr", dap.repl.open, opts)
	--vim.keymap.set("n", "gbt", dapui.toggle, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities();

require("rust-tools").setup({
	tools = {
		inlay_hints = {
			auto = false,
		}
	},
	server = {
		settings = {
			check = { command = "clippy" },
			 cargo = {features = "all"},
			diagnostics = { experimental = { enable = false } },
			completion = {
				autoself = { enable = false },
				fullFunctionSignatures = { enable = true },
				privateEditable = { enable = true },
			},
		},
		on_attach = function(_, bufnr)
			my_lsp_mappings(bufnr)
		end,
		capabilities = capabilities,
	},
})

require 'lspconfig'.typos_lsp.setup {}

require("mason-lspconfig").setup_handlers {
	-- default handler
	function(server_name)
		require("lspconfig")[server_name].setup {
			on_attach = function(_, bufnr)
				my_lsp_mappings(bufnr)
			end,
			capabilities = capabilities,
		}
	end,
	-- dedicated handlers
	["lua_ls"] = function()
		require("lspconfig")["lua_ls"].setup {
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							"vim",
						}
					}
				}
			},
			on_attach = function(_, bufnr)
				my_lsp_mappings(bufnr)
			end,
			capabilities = capabilities,
		}
	end,
}
