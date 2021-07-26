let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = "%-0.15{getcwd()} ==> %t"
let g:airline_section_z = "%l/%L"

let g:airline#extensions#clock#format = " %H:%M"
let g:airline#extensions#clock#updatetime = 1000
let g:airline#extensions#clock#auto = 0

function! AirlineInit()
	let g:airline_section_y = ""
	let g:airline_section_y = airline#section#create(['clock', g:airline_symbols.space, g:airline_section_y])
endfunction

autocmd User AirlineAfterInit call AirlineInit()

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
