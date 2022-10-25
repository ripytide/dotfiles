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

nmap <leader>u :Telescope find_files<CR>

nmap <leader>f :Neoformat<CR>

nnoremap <silent> <leader>j :Prettier<CR>

nmap <silent> g; A;<ESC>
nmap <silent> g, A,<ESC>

nnoremap <silent> <C-d> 10<C-e>
nnoremap <silent> <C-u> 10<C-y>

nnoremap <silent> <C-n> <C-o>
nnoremap <silent> <C-e> <C-i>

lua <<EOF
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local actions = require("telescope.actions")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")

-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
		mappings = {
		  i = {
			["<esc>"] = actions.close
		  },
		},
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
	},
})


require("telescope").load_extension("frecency")

EOF
