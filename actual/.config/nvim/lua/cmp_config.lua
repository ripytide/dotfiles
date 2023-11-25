local cmp = require 'cmp'
local lspkind = require('lspkind')
local luasnip = require('luasnip')
--luasnip.setup({history = true})

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
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
		{ name = 'nvim_lsp_signature_help', group_index = 1 },
		{ name = 'path',                    group_index = 1 },
		{ name = 'nvim_lua',                group_index = 1 },
		{ name = 'crates',                  group_index = 1 },

		{ name = 'buffer',                  group_index = 2 },
		--{name = 'luasnip'}
	}),
	preselect = cmp.PreselectMode.None,
	view = {
		entries = { name = 'custom', selection_order = 'near_cursor' },
		selection_order = 'near_cursor'
	},
	formatting = {
		formatting = {
			format = function(_, vim_item)
				vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
				return vim_item
			end
		}
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
