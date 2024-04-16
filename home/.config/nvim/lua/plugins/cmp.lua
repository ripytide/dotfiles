local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"zjp-CN/nvim-cmp-lsp-rs",
		},
		--@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local compare = require("cmp").config.compare

			opts.preselect = cmp.PreselectMode.None
			opts.completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			}

			opts.view = {
				entries = {
					name = "custom",
					selection_order = "near_cursor",
				},
			}

			local my_mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						-- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- this way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}

			opts.mapping = vim.tbl_deep_extend("force", opts.mapping, my_mapping)

			opts.formatting = {
				format = function(_, vim_item)
					vim_item.menu = nil
					return vim_item
				end,
			}

			opts.window = {
				completion = { border = "single" },
				documentation = { border = "single" },
			}

			local cmp_rs = require("cmp_lsp_rs")
			local comparators = cmp_rs.comparators

			opts.sorting.comparators = {
				-- compare.kind,
				-- comparators.inherent_import_inscope,
				-- comparators.inscope_inherent,
				compare.score,
				comparators.inscope_inherent_import,
				comparators.sort_by_label_but_underscore_last,
				-- compare.recently_used,
				-- compare.sort_text,
			}

			for _, source in ipairs(opts.sources) do
				cmp_rs.filter_out.entry_filter(source)
			end

			return opts
		end,
		init = function(_)
			local cmp = require("cmp")

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
