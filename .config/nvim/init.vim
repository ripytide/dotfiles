" enable vim features which seperate it from vi
set nocompatible

set encoding=utf-8
" attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" when set, hidden allows you to :e another file without first saving the file
" you were on before if that file has unsaved changes
set hidden

" a nicer command autocomplete tab and s-tab for forward and back set wildmenu,
" commas seperate first second and so on presses
" make wildmenu case insensitive
set wildmenu
set wildmode=full
set wildignorecase

"show partial normal mode commands in the bottom right
set showcmd

" runs vim commands from the text in the current file, i dont use and it can be
" security vun so i disable it
set nomodeline

" highlights search results
set hlsearch

" search is executed incremetally as typing search query instead of only after
" pressing enter
set incsearch

" case is ignored by default when searching, however, if an upper case letter
" is used then the search does become case sensitive
set ignorecase
set smartcase

" copy indent from current line when starting another line e.g hitting enter
" in insert mode, or o/O commands in normal mode
" also a bit like vscode if you don't type anything on the new line then the
" indent is deleted
set autoindent

" smart indent automagically knows to indent you if you press enter after a
" line that ends in {
" it also knows the 'cinwords' like if and while and will indent after those
" lines too
" finally also indents when using O conmmand on a line that starts with }
set smartindent

" sets format options see :h fo-table for full list
" stuff like comments falling onto next line if they get toooooooo
" loooooooongg
set formatoptions=tcrj

" shows current line number + , + current column number
set ruler

" highlight the line the cursor is on
set cul

" when set to 2 a status bar is always displayed
set laststatus=2

" makes vim ask for confirmation when you try to :q or other things abandoning
" actions from an
" unsaved buffer
set confirm

" set the command window height to 2 lines
set cmdheight=2

" display line numbers on the left, also setting relativenumber gives hybrid
" of relative number and normal number for the current line
set number
set relativenumber

" keeps cursor in the centre of the sreen
set scrolloff=8

" quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" sets the amount of spaces that vim considers an indent for commands like <
" or >
set shiftwidth=4

" the number of spaces that a tab character counts as when displayed
set tabstop=4

" enable syntax highlighting
if has('syntax')
    syntax on
endif

" the number of suggestions shown for suggestions
set pumheight=5

" settings reccomended for coc.nvim see their readme
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)




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
call plug#end()

colorscheme gruvbox

" custom vim bindings
let mapleader = "\\"
nmap <SPACE> <leader>

" able to toggle nerd tree with ^F6
" nmap <F6> :NERDTreeToggle<CR>

" silently (not visible in command line) map escape to temporarily turn off
" highlighting
nnoremap <silent> <ESC> :noh<CR>:match none<CR>

" highlight current line
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" vim fzf bindings
nnoremap <leader>p :Files<CR>

nmap <leader>n :bnext<CR>
nmap <leader>e :bprev<CR>

" make vim-emmet expand on tab
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" workman rebind movement keys back to normal positions
noremap n j
noremap j n
noremap e k
noremap k e
noremap y h
noremap h y
noremap o l
noremap l o

noremap N J
noremap J N
noremap E K
noremap K E
noremap Y H
noremap H Y
noremap O L
noremap L O
