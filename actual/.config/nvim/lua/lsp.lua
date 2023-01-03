local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({'tsserver', 'sumneko_lua'})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua',
              {settings = {Lua = {diagnostics = {globals = {'vim'}}}}})

local cmp_mappings = lsp.defaults.cmp_mappings({["<TAB>"] = nil})

lsp.setup_nvim_cmp({mappings = cmp_mappings})

lsp.set_preferences({
    suggest_lsp_servers = true,
    set_lsp_keymaps = false,
    sign_icons = {error = 'E', warn = 'W', hint = 'H', info = 'I'}
})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)

    vim.keymap.set("n", "go", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({virtual_text = true})
