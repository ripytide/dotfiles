local cmp = require("cmp")
local luasnip = require("luasnip")
local types = require("cmp.types")
--luasnip.setup({history = true})

local symbols = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	window = {
		completion = {
			border = 'single',
		},
		documentation = {
			border = 'single',
		},
	},
	preselect = cmp.PreselectMode.None,
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<TAB>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp',                group_index = 1 },
		{ name = 'path',                    group_index = 1 },
		{ name = 'nvim_lua',                group_index = 1 },
		{ name = 'crates',                  group_index = 1 },

		{ name = 'buffer',                  group_index = 2 },
		--{name = 'luasnip'}
	}),
	view = {
		entries = { name = 'custom', selection_order = 'near_cursor' },
		selection_order = 'near_cursor'
	},
	formatting = {
		fields = { "abbr", "menu", "kind" },
		format = function(_, item)
			local max_abbr_width = 30;
			if #item.abbr > max_abbr_width then
				item.abbr = vim.fn.strcharpart(item.abbr, 0, max_abbr_width - 3) .. "..."
			else
				item.abbr = item.abbr .. (" "):rep(max_abbr_width - #item.abbr)
			end

			local max_menu_width = 30;
			if item.menu then
				if #item.menu > max_menu_width then
					item.menu = vim.fn.strcharpart(item.menu, 0, max_menu_width - 3) .. "..."
				else
					item.menu = item.menu .. (" "):rep(max_menu_width - #item.menu)
				end
			else
				item.menu = ""
			end

			item.kind = (symbols[item.kind] or "") .. " " .. item.kind

			return item
		end,
	},
	sorting = {
		comparators = {
			function(entry1, entry2)
				local is1 = entry1:get_kind() == types.lsp.CompletionItemKind.Field
				local is2 = entry2:get_kind() == types.lsp.CompletionItemKind.Field

				if is1 ~= is2 then
					if is1 then
						return true
					else
						return false
					end
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
	}
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})
