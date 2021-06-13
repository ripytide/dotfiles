call plug#begin()

Plug 'morhetz/gruvbox'

Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

"Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = "%{getcwd()} ==> %t"
Plug 'vim-airline/vim-airline-themes'

"kinetic page moving
"Plug 'yuttie/comfortable-motion.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'tpope/vim-repeat'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

"limit use of j and k
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
let g:ultisnips_javascript = {'keyword-spacing': 'always', 'semi': 'never','space-before-function-paren': 'never',}

Plug 'ripytide/vim-snippets'

Plug 'jiangmiao/auto-pairs'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'junegunn/goyo.vim'
let g:goyo_width = 140
let g:goyo_height = '100%'

Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 7
let g:limelight_priority = -1

call plug#end()
