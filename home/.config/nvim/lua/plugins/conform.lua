return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			cs = { "csharpier" },
			xml = { "prettier", lsp_format = "fallback" },
		},
	},
	keys = {
		{ "<leader>cf", function() end, ft = "cpp"},

	},
}
