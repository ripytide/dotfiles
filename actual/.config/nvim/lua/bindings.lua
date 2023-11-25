-- make leader backslash so it shows up in the command preview
vim.g.mapleader = "\\"
vim.keymap.set("n", "<Space>", "<leader>")
vim.keymap.set("v", "<Space>", "<leader>")
-- workman rebind movement keys back to normal positions
vim.cmd("set langmap=nj,jn,ek,ke,yh,hy,ol,lo,NJ,JN,EK,KE,YH,HY,OL,LO")

-- fix wierd x then down does a search bug
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "x", "dl")
vim.keymap.set("n", ".", ".jk")
vim.keymap.set("n", "D", "Djk")

vim.keymap.set("i", "<C-e>", "<End>")
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-k>", "<Esc>lDa")

-- to temporarily turn off highlighting
vim.keymap.set("n", "<Esc>", "noh<CR>:match none<CR>")

vim.keymap.set("n", "<C-u>", "10<C-y>")
vim.keymap.set("n", "<C-d>", "10<C-e>")

vim.keymap.set("n", "<C-e>", "<C-i>")
vim.keymap.set("n", "<C-n>", "<C-o>")

vim.keymap.set("n", "<leader>,", ":cn<CR>")
vim.keymap.set("n", "<leader>_", ":cp<CR>")

vim.keymap.set("n", "K", "<Plug>MoveLineUp")
vim.keymap.set("n", "J", "<Plug>MoveLineDown")

vim.keymap.set("v", "K", "<Plug>MoveBlockUp")
vim.keymap.set("v", "J", "<Plug>MoveBlockDown")

vim.keymap.set("n", "H", "mzJ'z")

vim.keymap.set("n", "<leader>m", "zz")

vim.keymap.set("n", "<leader>g", ":RustOpenExternalDocs<CR>")

-- == Insert and Append Instant ==
-- extra append/insert immediate keybinds
-- this is so cursed lol
local all = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
	'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '_', '*', '[', ']', '{', '}', '(', ')',
	',', '.', '-', '+', ';', '!', '@', '#', '$', '%', '^', '&', '/', '|', '\\', '`', '~', '<', '>', '"', "'" }

for _, char in ipairs(all) do
	vim.keymap.set("n", "q" .. char, "A" .. char .. "<Esc>")
end

-- == Other ==
vim.keymap.set("n", "<leader>f", ":Neoformat<CR>")
vim.keymap.set("n", "<leader>l", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>h", ":HardTimeToggle<CR>")

-- == Telescope ==
vim.keymap.set("n", "<leader>u", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>j", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>s", ":Telescope lsp_dynamic_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>r", ":Telescope resume<CR>")


-- == Vim Subversive ==
-- s for substitute
vim.keymap.set("n", "s", "<Plug>SubversiveSubstitute")
vim.keymap.set("n", "ss", "<Plug>SubversiveSubstituteLine")
vim.keymap.set("n", "S", "<Plug>SubversiveSubstituteToEndOfLine")

-- == Vim cutlass
-- map m to a new cut key
vim.keymap.set("n", "m", "d")
vim.keymap.set("x", "m", "d")
vim.keymap.set("n", "mm", "dd")
vim.keymap.set("n", "M", "D")

-- == Bufferline ==
-- Move to previous/next
vim.keymap.set("n", "<leader>e", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>n", ":BufferLineCyclePrev<CR>")
-- Close buffer
vim.keymap.set("n", "<leader>d", ":bd!<CR>")
-- Wipeout buffers
vim.keymap.set("n", "<leader>w", ":%bd!<CR>")
-- Delete all buffers but the current one
--nnoremap <silent>    <leader>a mz:%bd!\|e#\|bd!#<CR>'z
vim.keymap.set("n", "<leader>a", ':%bd!|e#|normal `"<CR>')

-- == Zoxide ==
vim.keymap.set("n", "<leader>p", require("telescope").extensions.zoxide.list)

-- == Inc-Rename ==
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
