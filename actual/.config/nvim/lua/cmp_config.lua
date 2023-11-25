local cmp = require 'cmp'
local luasnip = require('luasnip')
--luasnip.setup({history = true})

local fixed_width = 40;
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
		{ name = 'nvim_lsp_signature_help', group_index = 1 },
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
		format = function(entry, item)
			-- Set the fixed width of the completion menu to 60 characters.
			-- fixed_width = 20

			-- Set 'fixed_width' to false if not provided.
			fixed_width = fixed_width or false

			-- Get the completion entry text shown in the completion window.
			local content = item.abbr

			-- Set the fixed completion window width.
			if fixed_width then
				vim.o.pumwidth = fixed_width
			end

			-- Get the width of the current window.
			local win_width = vim.api.nvim_win_get_width(0)

			-- Set the max content width based on either: 'fixed_width'
			-- or a percentage of the window width, in this case 20%.
			-- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
			local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

			-- Truncate the completion entry text if it's longer than the
			-- max content width. We subtract 3 from the max content width
			-- to account for the "..." that will be appended to it.
			if #content > max_content_width then
				item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
			else
				item.abbr = content .. (" "):rep(max_content_width - #content)
			end
			return item
		end,
	},
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
