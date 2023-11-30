-- make leader backslash so it shows up in the command preview
vim.g.mapleader = "\\"
vim.keymap.set("n", "<Space>", "<leader>", { remap = true })
vim.keymap.set("v", "<Space>", "<leader>", { remap = true })
-- workman rebind movement keys back to normal positions
vim.cmd("set langmap=nj,jn,ek,ke,yh,hy,ol,lo,NJ,JN,EK,KE,YH,HY,OL,LO")

local opts = { silent = true }

-- fix weird x then down does a search bug
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "x", "dl", opts)
vim.keymap.set("n", ".", ".jk", opts)
vim.keymap.set("n", "D", "Djk", opts)
vim.keymap.set("n", ".", ".jk", { silent = true, remap = true })

vim.keymap.set("i", "<C-e>", "<End>", opts)
vim.keymap.set("i", "<C-a>", "<Home>", opts)
vim.keymap.set("i", "<C-k>", "<Esc>lDa", opts)

vim.keymap.set("n", "<C-u>", "10<C-y>", opts)
vim.keymap.set("n", "<C-d>", "10<C-e>", opts)

vim.keymap.set("n", "<C-e>", "<C-i>", opts)
vim.keymap.set("n", "<C-n>", "<C-o>", opts)

vim.keymap.set("n", "<leader>,", ":cn<CR>", opts)
vim.keymap.set("n", "<leader>_", ":cp<CR>", opts)

vim.keymap.set("n", "K", "<Plug>MoveLineUp", opts)
vim.keymap.set("n", "J", "<Plug>MoveLineDown", opts)

vim.keymap.set("v", "K", "<Plug>MoveBlockUp", opts)
vim.keymap.set("v", "J", "<Plug>MoveBlockDown", opts)

vim.keymap.set("n", "H", "mzJ'z", opts)

vim.keymap.set("n", "<leader>m", "zz", opts)

vim.keymap.set("n", "<leader>g", ":RustOpenExternalDocs<CR>", opts)

-- == Insert and Append Instant ==
-- extra append/insert immediate keybinds
-- this is so cursed lol
local all = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
	'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '_', '*', '[', ']', '{', '}', '(', ')',
	',', '.', '-', '+', ';', '!', '@', '#', '$', '%', '^', '&', '/', '|', '\\', '`', '~', '<', '>', '"', "'" }

for _, char in ipairs(all) do
	vim.keymap.set("n", "q" .. char, "A" .. char .. "<Esc>", opts)
end

-- == Other ==
vim.keymap.set("n", "<leader>f", ":Neoformat<CR>", opts)
vim.keymap.set("n", "<leader>l", ":LazyGit<CR>", opts)
vim.keymap.set("n", "<leader>h", ":HardTimeToggle<CR>", opts)

-- == Telescope ==
vim.keymap.set("n", "<leader>u", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>j", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>s", ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)
vim.keymap.set("n", "<leader>r", ":Telescope resume<CR>", opts)


-- == substitute.nvim ==
vim.keymap.set("n", "s", require('substitute').operator, opts)
vim.keymap.set("n", "ss", require('substitute').line, opts)
vim.keymap.set("n", "S", require('substitute').eol, opts)
vim.keymap.set("x", "s", require('substitute').visual, opts)

-- == Vim cutlass
-- map m to a new cut key
vim.keymap.set("n", "m", "d", opts)
vim.keymap.set("x", "m", "d", opts)
vim.keymap.set("n", "mm", "dd", opts)
vim.keymap.set("n", "M", "D", opts)

-- == Bufferline ==
-- Move to previous/next
vim.keymap.set("n", "<leader>e", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<leader>n", ":BufferLineCyclePrev<CR>", opts)
-- Close buffer
vim.keymap.set("n", "<leader>d", ":bd!<CR>", opts)
-- Wipeout buffers
vim.keymap.set("n", "<leader>w", ":%bd!<CR>", opts)
-- Delete all buffers but the current one
--nnoremap <silent>    <leader>a mz:%bd!\|e#\|bd!#<CR>'z
vim.keymap.set("n", "<leader>a", ':%bd!|e#|normal `"<CR>', opts)

-- == Zoxide ==
vim.keymap.set("n", "<leader>p", require("telescope").extensions.zoxide.list, opts)
