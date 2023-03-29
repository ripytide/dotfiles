local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local actions = require("telescope.actions")
local z_utils = require("telescope._extensions.zoxide.utils")

-- Clone the default Telescope configuration
local vimgrep_arguments = {unpack(telescopeConfig.values.vimgrep_arguments)}

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")

-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

telescope.setup({
    defaults = {
        -- `hidden = true` is not supported in text grep commands.
        vimgrep_arguments = vimgrep_arguments,
        mappings = {i = {["<esc>"] = actions.close}}
    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = {"rg", "--files", "--hidden", "--glob", "!.git/*"}
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
                ["<C-q>"] = {action = z_utils.create_basic_command("split")}
            }
        }
	}
})

telescope.load_extension("frecency")
telescope.load_extension("ui-select")
telescope.load_extension("zoxide")
telescope.load_extension("lsp_handlers")
