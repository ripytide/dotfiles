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

Plug 'simnalamburt/vim-mundo'

Plug 'sbdchd/neoformat'
let g:neoformat_enabled_python = ["black"]

Plug 'neovimhaskell/haskell-vim'

Plug 'https://github.com/svermeulen/vim-subversive'
" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

Plug 'svermeulen/vim-cutlass'
" map m to a new cut key
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

Plug 'svermeulen/vim-yoink'
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)
nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
" so new cut command is included in yoinks
let g:yoinkIncludeDeleteOperations = 1

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
let g:tokyonight_italic_keywords = 0

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Move to previous/next
nnoremap <silent>    <leader>n :BufferPrevious<CR>
nnoremap <silent>    <leader>e :BufferNext<CR>
" Close buffer
nnoremap <silent>    <leader>d :BufferClose<CR>
" Wipeout buffer
nnoremap <silent>    <leader>w :BufferWipeout<CR>
nnoremap <silent>    <leader>a :BufferCloseAllButCurrent<CR>
" Magic buffer-picking mode
nnoremap <silent>    <leader>p :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'tokyonight' }

Plug 'ActivityWatch/aw-watcher-vim'
call plug#end()
