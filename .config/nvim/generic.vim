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

" allow persistent undoing
set undodir=~/.config/nvim/undodir
set undofile

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
"
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

"" display line numbers on the left, also setting relativenumber gives hybrid
" of relative number and normal number for the current line
set number
set relativenumber

" keeps cursor in the centre of the sreen
set scrolloff=8

" quickly time out on keycodes, but never time out on mappings
" issues causing pause after pressing esc
"set notimeout ttimeout ttimeoutlen=200

" sets the amount of spaces that vim considers an indent for commands like <
" or >
set shiftwidth=4

" the number of spaces that a tab character counts as when displayed
set tabstop=4

" enable syntax highlighting
if has('syntax')
    syntax on
endif

set colorcolumn=80

set list lcs=tab:\|\  

set foldmethod=indent
set nofoldenable
