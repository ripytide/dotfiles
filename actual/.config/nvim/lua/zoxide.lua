local t = require("telescope")
local z_utils = require("telescope._extensions.zoxide.utils")

-- Configure the extension
t.setup({
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

-- Load the extension
t.load_extension('zoxide')
