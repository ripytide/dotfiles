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
