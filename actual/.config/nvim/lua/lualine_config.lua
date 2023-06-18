--local lsp_progress = {
    --'lsp_progress',
    --display_components = {
        --'spinner', 'lsp_client_name', 'spinner',
        --{'title', 'percentage', 'message'}
    --},
    --separators = {
        --percentage = {pre = '', post = '%% '},
        --title = {pre = '', post = ': '},
        --lsp_client_name = {pre = '', post = ''},
        --spinner = {pre = '', post = ''},
        --message = {commenced = 'In Progress', completed = 'Completed'}
    --},
    --timer = {
        --progress_enddelay = 500,
        --spinner = 100,
        --lsp_client_name_enddelay = 500
    --},
    --spinner_symbols = {
        --'🌑', '🌒', '🌓', '🌔', '🌕', '🌖', '🌗', '🌘'
    --}
--}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        refresh = {statusline = 100}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename', "lsp_progress"},
        lualine_c = {
            'diff',
            {
                'diagnostics',
                sources = {'nvim_lsp'},
                sections = {'error', 'warn'}
            }
        },
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {}
}
