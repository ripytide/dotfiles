-- Set up nvim-cmp.
local cmp = require 'cmp'
local lspkind = require('lspkind')
local luasnip = require('luasnip')
--luasnip.setup({history = true})

local types = require('cmp.types')

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
        ['<CR>'] = cmp.mapping.confirm({select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
        --['<C-p>'] = function(_) luasnip.jump(1) end,
        --['<C-u>'] = function(_) luasnip.jump(-1) end
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp', group_index = 1},
		{name = 'nvim_lsp_signature_help', group_index = 1},
		{name = 'path', group_index = 1},
		{name = 'nvim_lua', group_index = 1},

		{name = 'buffer', group_index = 2},
		--{name = 'luasnip'}
    }),
    preselect = cmp.PreselectMode.None,
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor'},
        selection_order = 'near_cursor'
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 30, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...' -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        })
    },
	sorting = {
        comparators = {
			function (entry1, entry2) 
			  local is1 = entry1:get_kind()== types.lsp.CompletionItemKind.Field
			  local is2 = entry2:get_kind()== types.lsp.CompletionItemKind.Field

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
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})
