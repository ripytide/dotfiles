require("mason").setup()
require("mason-lspconfig").setup()

local dap = require("dap")
local dapui = require("dapui")

local codelldb_path = "/usr/bin/codelldb"
local liblldb_path = "/usr/lib/codelldb/lldb/lib/liblldb.so"
local rt = require("rust-tools")

local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local border_style = "single"

dapui.setup()

vim.diagnostic.config {virtual_text = false}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
 vim.lsp.handlers.hover, {
   border = border_style,
   title = "hover"
 }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
 vim.lsp.handlers.signature_help, {
   border = border_style
 }
)

local function normal_lsp_mappings(bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gj", function() vim.diagnostic.goto_next({float={border=border_style}}) end, opts)
	vim.keymap.set("n", "gk", function() vim.diagnostic.goto_prev({float={border=border_style}}) end, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	vim.keymap.set("n", "gbb", dap.toggle_breakpoint, opts)
	vim.keymap.set("n", "gbc", dap.continue, opts)
	vim.keymap.set("n", "gbs", dap.step_over, opts)
	vim.keymap.set("n", "gbi", dap.step_into, opts)
	vim.keymap.set("n", "gbr", dap.repl.open, opts)
	vim.keymap.set("n", "gbt", dapui.toggle, opts)
end

local rust_tools_options = {
    server = {
		settings = {["rust-analyzer"] = {inlayHints = {chainingHints = false, parameterHints = false, typeHints = false, closingBraceHints = false}}},
        on_attach = function(_, bufnr)
			normal_lsp_mappings(bufnr)

            vim.keymap.set("n", "gz", rt.hover_actions.hover_actions, {buffer = bufnr})
            vim.keymap.set(
                "n",
                "<leader>k",
                function()
                    rt.move_item.move_item(false)
                end,
                {buffer = bufnr}
            )
            vim.keymap.set(
                "n",
                "<leader>y",
                function()
                    rt.move_item.move_item(true)
                end,
                {buffer = bufnr}
            )
        end
    },
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
    }
}
rt.setup(rust_tools_options)

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {
			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			on_attach = function(_, bufnr)
				normal_lsp_mappings(bufnr)
			end
		}
	end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
	--["rust_analyzer"] = function()
	--end,
}
