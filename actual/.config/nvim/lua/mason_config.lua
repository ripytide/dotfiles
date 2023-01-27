require("mason").setup()
require("mason-lspconfig").setup()
local dapui = require("dapui")
dapui.setup()

vim.diagnostic.config {virtual_text = false}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)
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
    vim.keymap.set("n", "gbo", dapui.toggle, opts)
end

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {on_attach = on_attach}
    end
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    --["rust_analyzer"] = function()
    --require("rust-tools").setup {}
    --end
}
