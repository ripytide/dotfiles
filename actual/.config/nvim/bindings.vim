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

nmap <leader>u :Telescope find_files <CR>

nmap <leader>f :Neoformat<CR>

nnoremap <silent> <leader>j :Prettier<CR>

nmap <silent> g; A;<ESC>
nmap <silent> g, A,<ESC>

nnoremap <silent> <C-n> <C-o>
nnoremap <silent> <C-e> <C-i>

" make esc esc in insert mode
lua <<EOF
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
EOF

" load frecency extension
lua <<EOF
require("telescope").load_extension("frecency")
EOF
