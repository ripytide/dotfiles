require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "rust", "javascript"},
    highlight = {
      enable = true,
      -- list of language that will be disabled
      disable = { "c", "rust" },
      additional_vim_regex_highlighting = false,
    },
  }
