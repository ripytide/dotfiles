local telescope = require("telescope")
local actions = require("telescope.actions")
local z_utils = require("telescope._extensions.zoxide.utils")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-u>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
			n = {
				["<C-q>"] = actions.send_to_qflist,
			}
		},
		layout_config = {
			width = 500, height = 500,
		},
		theme = "dropdown",
		prompt_prefix = "🔍",
	},
	pickers = {
		find_files = {
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"-g", "!**/.git/*",
				"-g", "!**/package-lock.json",
				"-g", "!**/*.svg",
				"-g", "!**/node_modules/*",
				"-g", "!**/libs/*",
				"-g", "!**/Cargo.lock",
				"-g", "!**/venv/",
			},
		},
		live_grep = {
			additional_args = {
				"-g", "!**/.git/*",
				"-g", "!**/package-lock.json",
				"-g", "!**/*.svg",
				"-g", "!**/node_modules/*",
				"-g", "!**/libs/*",
				"-g", "!**/Cargo.lock",
				"-g", "!**/venv/",
			}
		}
	},
	extensions = {
		zoxide = {
			prompt_title = "[ Zoxide ]",
			mappings = {
				default = {
					after_action = function(selection)
						print("Update to (" .. selection.z_score .. ") " ..
							selection.path)
					end
				},
				["<C-s>"] = {
					before_action = function(_)
						print("before C-s")
					end,
					action = function(selection)
						vim.cmd("edit " .. selection.path)
					end
				},
				["<C-q>"] = { action = z_utils.create_basic_command("split") }
			}
		}
	}
})

telescope.load_extension("ui-select")
telescope.load_extension("zoxide")
telescope.load_extension("lsp_handlers")
