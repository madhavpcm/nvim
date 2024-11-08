--
-- Options
--
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.formatoptions:remove "o"

vim.opt.spellfile = vim.fn.stdpath "config" .. "/spell/en.utf-8.add"

--
-- Disable netrw
--
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--
-- Keymaps
--
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ww", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Tree" })
vim.keymap.set("n", "<leader>_", "5<c-w>-", { desc = "Decrease bottom window padding", remap = true, silent = false })
vim.keymap.set("n", "<leader>+", "5<c-w>+", { desc = "Increase bottom window padding", remap = true, silent = false })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep cursor centered" })
vim.keymap.set("n", "<C-u>", "C-u>zz", { desc = "Scroll up and Center" })
vim.keymap.set("n", "<C-d>", "C-d>zz", { desc = "Scroll up and Center" })

-- Clipboard
-- <C-c> => copy to global clipboard
-- y,p,d => copy to vim clipboard
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set({ "n", "v", "x" }, "<C-c>", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<D-c>", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<C-p>", '"+p')
vim.keymap.set({ "v" }, "p", '"_dP')
vim.keymap.set("i", "<c-p>", function()
  require("telescope.builtin").registers()
end, {
  remap = true,
  silent = false,
  desc = " and paste register in insert mode",
})

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "Unbind space key" })
vim.keymap.set("n", "<BS>", "^", { desc = "Move to first non blank character" })

-- BarBar
local opts = { noremap = true, silent = true }

-- Buffer Manipulation
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
vim.keymap.set("n", "<A-q>", "<Cmd>BufferCloseAllButVisible<CR>", opts)

-- Window Resize
vim.keymap.set("n", "<C-h>", "<Cmd>vertical res -5<CR>", opts)
vim.keymap.set("n", "<C-l>", "<Cmd>vertical res +5<CR>", opts)
vim.keymap.set("n", "<C-]>", "<Cmd>ToggleTerm<CR>", opts)
vim.keymap.set("t", "<C-]>", "<Cmd>ToggleTerm<CR>", opts)

-- Terminal
vim.keymap.set("t", "<C-w><C-w>", "<C-w>w", { noremap = true })

-- Selection, Search, Replace
vim.keymap.set("n", "s", "", { desc = "Selection Commands", nowait = true, remap = false })
vim.keymap.set("n", "sa", "ggVG<CR>", { desc = "Select all", nowait = true, remap = false })
vim.keymap.set("n", "sap", "ggVGp<CR>", { desc = "Select all and paste", nowait = true, remap = false })
vim.keymap.set("n", "se", "vg_<CR>", { desc = "Select till end of line", nowait = true, remap = false })
vim.keymap.set("n", "ss", ":s/\\v", { silent = false, desc = "search and replace on line" })
vim.keymap.set("n", "SS", ":%s/\\v", { silent = false, desc = "search and replace in file" })
vim.keymap.set(
  "v",
  "<leader><C-s>",
  ":%s/\\%V",
  { silent = false, desc = "search and replace in selection using %V atom" }
)
vim.keymap.set("v", "<C-r>", '"hy:%s/\\v<C-r>h//g<left><left>"', { silent = false, desc = "change selection" })

-- Undotree
vim.cmd [[ 
	autocmd BufReadPost * call ReadUndo()
	autocmd BufWritePost * call WriteUndo()

	func ReadUndo()
		let undodir = expand('~/.config/nvim/.undodir') .. expand('%:p:h') 
		let undofile = undodir .. '/' .. expand('%:t')

		if filereadable(undofile) 
			rundo ~/.config/nvim/.undodir/%:p:h/%:t
		endif
	endfunc

	func WriteUndo()
		let undodir = expand('~/.config/nvim/.undodir') .. expand('%:p:h')

		if !isdirectory(undodir)
			call mkdir(undodir, 'p')
		endif

		wundo ~/.config/nvim/.undodir/%:p:h/%:t
	endfunc
]]

-- Open directories, set title accordingly
vim.cmd [[
	if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif
]]
vim.o.title = true
vim.o.titlestring = vim.fn.getcwd()
vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = function()
    vim.o.titlestring = vim.fn.getcwd()
  end,
})

-- Helm files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*/templates/*.yaml", "*/templates/*.tpl", "*.gotmpl", "helmfile*.yaml" },
  callback = function()
    vim.opt_local.filetype = "helm"
  end,
})

vim.cmd "colorscheme cyberdream"
