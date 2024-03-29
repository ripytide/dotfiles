return {
	"johmsalas/text-case.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	init = function(_)
		require("telescope").load_extension("textcase")
	end,
	keys = {
		{ "<leader>cc", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
	},
}
