local dapui = require("dapui")
dapui.setup()

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

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150
}
--require('lspconfig')['pyright'].setup {on_attach = on_attach, flags = lsp_flags}
--require('lspconfig')['tsserver'].setup {
    --on_attach = on_attach,
    --flags = lsp_flags
--}
-- require('lspconfig')['rust_analyzer'].setup {
-- on_attach = on_attach,
-- flags = lsp_flags,
---- Server-specific settings...
-- settings = {["rust-analyzer"] = {}}
-- }
