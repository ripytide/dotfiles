" == Core ==
let mapleader = "\\"
nmap <SPACE> <leader>
vmap <SPACE> <leader>

" workman rebind movement keys back to normal positions
set langmap=nj,jn,ek,ke,yh,hy,ol,lo,NJ,JN,EK,KE,YH,HY,OL,LO

nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" fix wierd x then down does a search bug
nnoremap <silent> x dl

" to temporarily turn off highlighting
nnoremap <silent> <ESC> :noh<CR>:match none<CR>

nnoremap <silent> <C-d> 10<C-e>
nnoremap <silent> <C-u> 10<C-y>

nnoremap <silent> <C-n> <C-o>
nnoremap <silent> <C-e> <C-i>

nnoremap <leader>_ :cp<CR>
nnoremap <leader>, :cn<CR>

nnoremap J <Plug>MoveLineDown
nnoremap K <Plug>MoveLineUp

vnoremap J <Plug>MoveBlockDown
vnoremap K <Plug>MoveBlockUp

nnoremap H mzJ'z

nmap <leader>t a<CR><ESC>ddP

noremap <leader>m zz

" == Insert and Append Instant ==
" extra append/insert immediate keybinds
" this is so cursed lol
let all = (['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '_', '*', '[', ']', '{', '}', '(', ')', ',', '.', '-', '+', ';', '!', '@', '#', '$', '%', '^', '&', '/', '\|', '\', '`', '~', '<', '>', '"', "'"])

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

" == Commands ==
nnoremap <leader>h :HardTimeToggle<CR>

nnoremap <leader>u :Telescope find_files<CR>
nnoremap <leader>j :Telescope live_grep<CR>
nnoremap <leader>s :Telescope lsp_dynamic_workspace_symbols<CR>

nnoremap <leader>f :Neoformat<CR>

nnoremap <silent> <leader>l :LazyGit<CR>

" == COC BINDINGS ==

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)
"nmap ga :Telescope coc code_actions<CR>
"nmap gs :Telescope coc workspace_symbols<CR>
"nmap gm :Telescope coc references<CR>
"nmap gr <Plug>(coc-rename)
"nmap <silent> gj <Plug>(coc-diagnostic-next)
"nmap <silent> gk <Plug>(coc-diagnostic-prev)
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nnoremap <silent> K :call ShowDocumentation()<CR>
"nnoremap <silent><nowait> <leader>o  :call ToggleOutline()<CR>

"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
  "nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  "vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

" == Vim Subversive ==
" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" == Vim cutlass
" map m to a new cut key
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" == Bufferline ==
" Move to previous/next
nnoremap <silent>    <leader>e :BufferLineCycleNext<CR>
nnoremap <silent>    <leader>n :BufferLineCyclePrev<CR>
" Close buffer
nnoremap <silent>    <leader>d :bw!<CR>
" Wipeout buffers
nnoremap <silent>    <leader>w :%bw!<CR>
" Delete all buffers but the current one
nnoremap <silent>    <leader>a mz:%bd!\|e#\|bw!#<CR>'z

" == Leap ==
"nnoremap <silent> z <Plug>(leap-forward-to)
"nnoremap <silent> Z <Plug>(leap-backward-to)

" == Zoxide ==
nnoremap <leader>p :lua require("telescope").extensions.zoxide.list()<CR>
