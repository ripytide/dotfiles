local codelldb_path = '/usr/bin/codelldb'
local liblldb_path = '/usr/lib/codelldb/lldb/lib/liblldb.so'

local rt = require("rust-tools")
local dap = require("dap")
local dapui = require("dapui")

local opts = {
    server = {
        -- todo remove locationLinks=false once the PR fixing the bug
        -- lands
        settings = {["rust-analyzer"] = {inlayHints = {locationLinks = false}}},
        on_attach = function(_, bufnr)
            local opts = {buffer = bufnr, remap = false}
            vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "go", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr",
                           require("telescope.builtin").lsp_references, opts)
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

            vim.keymap.set("n", "gbb", dap.toggle_breakpoint, opts)
            vim.keymap.set("n", "gbc", dap.continue, opts)
            vim.keymap.set("n", "gbs", dap.step_over, opts)
            vim.keymap.set("n", "gbi", dap.step_into, opts)
            vim.keymap.set("n", "gbr", dap.repl.open, opts)
            vim.keymap.set("n", "gbt", dapui.toggle, opts)

            vim.keymap.set("n", "gz", rt.hover_actions.hover_actions,
                           {buffer = bufnr})
            vim.keymap.set("n", "<leader>k",
                           function() rt.move_item.move_item(false) end,
                           {buffer = bufnr})
            vim.keymap.set("n", "<leader>y",
                           function() rt.move_item.move_item(true) end,
                           {buffer = bufnr})
        end
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path,
                                                                 liblldb_path)
    }
}

-- Normal setup
rt.setup(opts)
