require"dashboard".setup({
  theme = 'hyper',
  disable_move = true,
  change_to_vcs_root = true,
  config = {
	packages = { enable = false },
    week_header = {
     enable = true,
    },
	project = { icon = "⛳" },
    shortcut = {
		{ desc = '🗘 Update', group = '@property', action = 'PlugUpdate', key = 'u' },
    },
  },
})
