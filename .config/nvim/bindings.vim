let mapleader = "\\"
nmap <SPACE> <leader>
vmap <SPACE> <leader>

" able to toggle nerd tree with ^F6
" nmap <F6> :NERDTreeToggle<CR>

" silently (not visible in command line) map escape to temporarily turn off
" highlighting
nnoremap <silent> <ESC> :noh<CR>:match none<CR>

" highlight current line
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

nmap <leader>e :bnext<CR>
nmap <leader>n :bprev<CR>

" required as vim-fugitive binds this to something which makes vim wait when
" pressing y, so this unmaps it
" and autocmd is needed as init.vim is loaded before plugins
autocmd VimEnter * nunmap y<C-G>

nmap <leader>h :HardTimeToggle<CR>

" workman rebind movement keys back to normal positions
set langmap=nj,jn,ek,ke,yh,hy,ol,lo,NJ,JN,EK,KE,YH,HY,OL,LO

nmap <leader>d :Goyo<CR>
nmap <leader>q :Limelight!!<CR>

nmap <leader>p :Telescope find_files theme=get_ivy<CR>

nmap <leader>f :Prettier<CR>

nmap <leader>o :CocCommand editor.action.organizeImport<CR>
