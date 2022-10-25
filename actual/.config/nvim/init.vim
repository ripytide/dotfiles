source ~/.config/nvim/generic.vim

source ~/.config/nvim/plugins.vim

source ~/.config/nvim/new-coc.vim

source ~/.config/nvim/airline.vim

source ~/.config/nvim/bindings.vim

source ~/.config/nvim/telescope.vim

source ~/.config/nvim/tree-sitter.lua

colorscheme tokyonight
"colorscheme gruvbox
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

lua << EOF
require('octo').setup()
EOF
