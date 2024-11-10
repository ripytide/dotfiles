local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"zjp-CN/nvim-cmp-lsp-rs",
		"hrsh7th/cmp-cmdline",
		"onsails/lspkind.nvim",
	},
	--@param opts cmp.ConfigSchema
	opts = function(_, opts)
		local cmp = require("cmp")
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
				if vim.snippet.active({ direction = 1 }) then
					vim.snippet.jump(1)
				elseif cmp.visible() then
					cmp.select_next_item()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if vim.snippet.active({ direction = -1 }) then
					vim.snippet.jump(-1)
				elseif cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		}

		opts.mapping = vim.tbl_deep_extend("force", opts.mapping, my_mapping)

		opts.formatting = {
			-- format = function(_, vim_item)
			-- 	vim_item.menu = nil
			-- 	return vim_item
			-- end,

			format = require("lspkind").cmp_format({
				mode = "symbol", -- show only symbol annotations
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- can also be a function to dynamically calculate max width such as
				-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
				show_labelDetails = true, -- show labelDetails in menu. Disabled by default
			}),
		}

		opts.window = {
			completion = { border = "single" },
			documentation = { border = "single" },
		}

		opts.sorting.comparators = {
			compare.exact,
			compare.score,
			require("cmp_lsp_rs").inherent_import_inscope,
			-- comparators.inscope_inherent_import,
			require("cmp_lsp_rs").sort_by_label_but_underscore_last,
		}
		for _, source in ipairs(opts.sources) do
			require("cmp_lsp_rs").filter_out.entry_filter(source)
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
}
