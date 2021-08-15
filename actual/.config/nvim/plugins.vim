call plug#begin()

Plug 'morhetz/gruvbox'

Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

"Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'enricobacis/vim-airline-clock'

Plug 'vim-airline/vim-airline-themes'

"kinetic page moving
"Plug 'yuttie/comfortable-motion.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-repeat'

"limit use of j, k, h, l
Plug 'takac/vim-hardtime'
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 2

Plug 'romainl/vim-cool'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger="<c-u>"
imap <c-t> <Nop>
imap <c-h> <Nop>
let g:UltiSnipsJumpForwardTrigger="<c-t>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:UltiSnipsSnippetDirectories=["ripysnips"]

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapCR = 1
let g:AutoPairsCenterLine = 0
let g:AutoPairsShortcutToggle = '<c-q>'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'junegunn/goyo.vim'
let g:goyo_width = 140
let g:goyo_height = '100%'

Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 7
let g:limelight_priority = -1

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-eunuch'

Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,javascript,jsx'
let g:closetag_regions = {}

Plug 'simnalamburt/vim-mundo'

Plug 'sbdchd/neoformat'

Plug 'neovimhaskell/haskell-vim'
call plug#end()
