return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
          ["<C-u>"] = false,
          ["<C-q>"] = require("telescope.actions").send_to_qflist,
        },
        n = {
          ["<C-q>"] = require("telescope.actions").send_to_qflist,
        },
      },
      layout_config = {
        width = 500,
        height = 500,
      },
    },
  },
}
