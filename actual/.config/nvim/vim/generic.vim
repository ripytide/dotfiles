" when set, hidden allows you to :e another file without first saving the file
" you were on before if that file has unsaved changes
set hidden

" allow persistent undoing
set undodir=~/undodir
set undofile

" an endless source of anoyance
set noswapfile
set nobackup

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
"
" case is ignored by default when searching, however, if an upper case letter
" is used then the search does become case sensitive
set ignorecase
set smartcase

" sets format options see :h fo-table for full list
" stuff like comments falling onto next line if they get toooooooo
" loooooooongg
set formatoptions=crj

" highlight the line the cursor is on
set cul

" makes vim ask for confirmation when you try to :q or other things abandoning
" actions from an unsaved buffer
set confirm

"" display line numbers on the left, also setting relativenumber gives hybrid
" of relative number and normal number for the current line
set number
set relativenumber

" keeps cursor in the centre of the screen
set scrolloff=8

" sets the amount of spaces that vim considers an indent for commands like <
" or >
set shiftwidth=4

" the number of spaces that a tab character counts as when displayed
set tabstop=4

set colorcolumn=80

set foldmethod=indent
set nofoldenable

set textwidth=70

set nowrap

set iskeyword+=-

" the number of suggestions shown for suggestions
set pumheight=6

" Give less space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set signcolumn=yes

set termguicolors

set linebreak

set completeopt=menu,menuone,noinsert,noselect,preview
