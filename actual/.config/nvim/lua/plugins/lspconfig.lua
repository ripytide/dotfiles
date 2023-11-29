return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          keys = {
            { "K", false },
          },
          settings = {
            ["rust-analyzer"] = {
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
