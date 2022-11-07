let mapleader = "\\"
nmap <SPACE> <leader>
vmap <SPACE> <leader>

" silently (not visible in command line) map escape to temporarily turn off
" highlighting
nnoremap <silent> <ESC> :noh<CR>:match none<CR>

" highlight current line
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

nmap <leader>h :HardTimeToggle<CR>

" workman rebind movement keys back to normal positions
set langmap=nj,jn,ek,ke,yh,hy,ol,lo,NJ,JN,EK,KE,YH,HY,OL,LO

nmap <silent> g; A;<ESC>
nmap <silent> g, A,<ESC>

nnoremap <silent> <C-d> 10<C-e>
nnoremap <silent> <C-u> 10<C-y>

nnoremap <silent> <C-n> <C-o>
nnoremap <silent> <C-e> <C-i>


nmap <leader>f :! cargo fmt<CR>

nmap <leader>p :Telescope find_files<CR>

nnoremap <leader>j :Neoformat<CR>

nnoremap ; :lnext<CR>
nnoremap , :lprevious<CR>

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

nnoremap gq q

autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
