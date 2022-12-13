let mapleader = "\\"
nmap <SPACE> <leader>
vmap <SPACE> <leader>

" silently (not visible in command line) map escape to temporarily turn off
" highlighting
nnoremap <silent> <ESC> :noh<CR>:match none<CR>

nnoremap <leader>h :HardTimeToggle<CR>

" workman rebind movement keys back to normal positions
set langmap=nj,jn,ek,ke,yh,hy,ol,lo,NJ,JN,EK,KE,YH,HY,OL,LO

nnoremap <silent> <C-d> 10<C-e>
nnoremap <silent> <C-u> 10<C-y>

nnoremap <silent> <C-n> <C-o>
nnoremap <silent> <C-e> <C-i>

nnoremap <leader>u :Telescope find_files<CR>
nnoremap <leader>j :Telescope live_grep<CR>

nnoremap <leader>f :Neoformat<CR>

nnoremap <leader>_ :lnext<CR>
nnoremap <leader>, :lprevious<CR>

nmap <leader>t a<CR><ESC>ddP

noremap <leader>m zz

" extra append/insert immediate keybinds
" this is so cursed lol
let all = (['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '_', '*', '[', ']', '{', '}', '(', ')', ',', '.', '-', '+', ';', '!', '@', '#', '$', '%', '^', '&', '/', '\|', '\', '`', '~', '<', '>', '"'])

for x in all
	execute 'nnoremap <silent> ' . 'Q' . x . ' a' . x . '<ESC>'
endfor
for x in all
	execute 'nnoremap <silent> ' . 'q' . x . ' A' . x . '<ESC>'
endfor
for x in all
	execute 'nnoremap <silent> ' . ',' . x . ' i' . x . '<ESC>'
endfor
for x in all
	execute 'nnoremap <silent> ' . '_' . x . ' I' . x . '<ESC>'
endfor
