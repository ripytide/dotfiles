return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			cs = { "csharpier" },
			xml = { "prettier", lsp_format = "fallback" },
			rust = { "dx_fmt", lsp_format = "first" },
		},
		formatters = {
			csharpier = {
				command = "csharpier",
				args = { "format", "$FILENAME" },
				stdin = false,
			},
			dx_fmt = {
				command = "dx",
				args = { "fmt", "--file", "$FILENAME" },
				stdin = false,
			},
		},
	},
	keys = {
		-- disable formatting for cpp
		{ "<leader>cf", function() end, ft = "cpp" },
	},
}
