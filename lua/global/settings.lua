vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.relativenumber = true
vim.opt.termguicolors = true
-- Undo history
--vim.opt.undodir = "~/.cache/nvim/.undo//"
-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keymaps
--
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ww", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Tree" })

-- Clipboard
--
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "v", "x" }, "<C-c>", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<C-p>", '"+p')
vim.keymap.set({ "v" }, "p", '"_dP')

-- Set barbar's options
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode

-- window resize
map("n", "<C-h>", "<Cmd>vertical res -5<CR>", opts)
map("n", "<C-l>", "<Cmd>vertical res +5<CR>", opts)
map("n", "<C-]>", "<Cmd>ToggleTerm<CR>", opts)
map("t", "<C-]>", "<Cmd>ToggleTerm<CR>", opts)

--terminal
-- the Ctrl+ww and Ctrl+w w keys in the TERMINAL mode to the toggleterm function
map("t", "<C-w><C-w>", "<C-w>w", { noremap = true })

-- Undotree 
vim.cmd[[ 
	au BufReadPost * call ReadUndo()
	au BufWritePost * call WriteUndo()
	func ReadUndo()
	  if filereadable(expand('%:h') .. '/.undodir/' .. expand('%:t'))
		rundo %:h/.undodir/%:t
	  endif
	endfunc
	func WriteUndo()
	  let dirname = expand('%:h') .. '/.undodir'
	  if !isdirectory(dirname)
		call mkdir(dirname)
	  endif
	  wundo %:h/.undodir/%:t
	endfunc
]]

