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

" me like searching functions
nnoremap <silent> <leader>g :Telescope treesitter<CR>:function: 

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
