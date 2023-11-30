return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato",
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = { "bold" },
        booleans = {},
        properties = {},
        types = {},
        operators = { "bold" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
