local cmp = require("cmp")
return {
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = {
			preselect = "None",
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			},
			view = {
				entries = {
					name = "custom",
					selection_order = "near_cursor",
				},
			},
			window = {
				completion = { border = "single" },
				documentation = { border = "single" },
			},
			sorting = {
				comparators = {
					function(entry1, entry2)
						local isfield1 = entry1:get_kind() == require("cmp.types").lsp.CompletionItemKind.Field
						local isfield2 = entry2:get_kind() == require("cmp.types").lsp.CompletionItemKind.Field

						if isfield1 ~= isfield2 then
							return isfield1
						end
					end,
					function(entry1, entry2)
						local enum1 = entry1:get_kind() == require("cmp.types").lsp.CompletionItemKind.EnumMember
						local enum2 = entry2:get_kind() == require("cmp.types").lsp.CompletionItemKind.EnumMember

						local snip1 = entry1:get_kind() == require("cmp.types").lsp.CompletionItemKind.Snippet
						local snip2 = entry2:get_kind() == require("cmp.types").lsp.CompletionItemKind.Snippet

						if enum1 and snip2 then
							return true
						elseif enum2 and snip1 then
							return false
						end
					end,
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
					cmp.config.compare.kind,
				},
			},
			matching = {
				disallow_fuzzy_matching = true,
				disallow_fullfuzzy_matching = true,
				disallow_partial_fuzzy_matching = true,
				disallow_partial_matching = false,
				disallow_prefix_unmatching = false,
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
		},
		config = function(_, opts)
			local luasnip = require("luasnip")

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			opts.mapping = vim.tbl_extend("force", opts.mapping, {
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
			})

			cmp.setup(opts)

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
