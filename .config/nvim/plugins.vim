call plug#begin()
Plug 'morhetz/gruvbox'
Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1

""""Plug 'tpope/vim-fugitive'

""Plug 'tpope/vim-surround'

""Plug 'scrooloose/nerdtree'

""Plug 'scrooloose/syntastic'
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0

Plug 'vim-airline/vim-airline'
" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = "%{getcwd()} ==> %t"
Plug 'vim-airline/vim-airline-themes'

" kinetic page moving
"Plug 'yuttie/comfortable-motion.vim'

"Plug 'scrooloose/nerdcommenter'

"Plug 'tpope/vim-repeat'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

"Plug 'takac/vim-hardtime'

"Plug 'valloric/youcompleteme'

Plug 'romainl/vim-cool'

Plug 'mattn/emmet-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'turbio/bracey.vim'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger="<c-u>"

imap <c-h> <Nop>
imap <c-t> <Nop>
let g:UltiSnipsJumpForwardTrigger="<c-t>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:ultisnips_javascript = {'keyword-spacing': 'always', 'semi': 'never','space-before-function-paren': 'never',}

Plug 'honza/vim-snippets'

Plug 'jiangmiao/auto-pairs'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()
