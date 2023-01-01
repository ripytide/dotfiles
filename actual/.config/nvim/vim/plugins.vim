call plug#begin()
Plug 'morhetz/gruvbox'

Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-repeat'

" muslcle training
Plug 'takac/vim-hardtime'
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 0
let g:hardtime_maxcount = 4

Plug 'romainl/vim-cool'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapCR = 1
let g:AutoPairsCenterLine = 0
let g:AutoPairsShortcutToggle = '<c-q>'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('tami5/sqlite.lua')
Plug('nvim-telescope/telescope-frecency.nvim')

Plug 'tpope/vim-eunuch'

Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,javascript,jsx'
let g:closetag_regions = {}

Plug 'sbdchd/neoformat'
let g:neoformat_enabled_python = ["black"]

Plug 'neovimhaskell/haskell-vim'

Plug 'https://github.com/svermeulen/vim-subversive'

Plug 'svermeulen/vim-cutlass'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
let g:tokyonight_italic_keywords = 0

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'itchyny/lightline.vim'
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'cocstatus', 'currentfunction' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

Plug 'ActivityWatch/aw-watcher-vim'

Plug 'p00f/nvim-ts-rainbow'

Plug 'ggandor/leap.nvim', {'branch': 'main'}

Plug 'rhysd/clever-f.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'jvgrootveld/telescope-zoxide', {'branch': 'main'}

Plug 'fannheyward/telescope-coc.nvim'

Plug 'tpope/vim-abolish'

Plug 'ripytide/rust.vim'

Plug 'mbbill/undotree'

Plug 'kdheepak/lazygit.nvim', {'branch': 'main'}
call plug#end()
