require("leap").setup({
	equivalence_classes = { " \t\r\n" },
	safe_labels = {},
	highlight_unlabeled_phase_one_targets = true,
	special_keys = {
		repeat_search = "<enter>",
		next_phase_one_target = nil,
		next_target = {},
		prev_target = {},
		next_group = "<space>",
		prev_group = "<tab>",
		multi_accept = "<enter>",
		multi_revert = "<backspace>",
	},
})
