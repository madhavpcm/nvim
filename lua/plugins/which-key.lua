local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  print "which-key not installed."
  return
end

wk.setup({
  notify = false,
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
  },
})


-- Binds with Leader normal mode
local opts = {
  Gvdiffsplitmode = "n", -- NORMAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings= {
	-- b
	{ "<leader>b", group = "Buffer Commands", nowait = true, remap = false },
	{ "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", desc = "Order buffers by Number", nowait = true, remap = false },
	{ "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", desc = "Order buffers by Directory", nowait = true, remap = false },
	{ "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", desc = "Order buffers by Language", nowait = true, remap = false },
	{ "<leader>bp", "<Cmd>BufferPick<CR>", desc = "Pick buffer", nowait = true, remap = false },
	{ "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", desc = "Order buffers by window number", nowait = true, remap = false },
	-- f
	{ "<leader>f", group = "File Ops", nowait = true, remap = false },
	{ "<leader>fe", desc = "Edit File", nowait = true, remap = false },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", nowait = true, remap = false },
	{ "<leader>fn", desc = "New File", nowait = true, remap = false },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
	{ "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", nowait = true, remap = false },
	--g
	{ "<leader>g", group="Git Ops", nowait=true, remap=false},
	{ "<leader>gbr", "<cmd>GBrowse<cr>", desc = "Git Browse in webui", nowait = true, remap = false },
	{ "<leader>gbc", function() vim.cmd "GBrowse!" end, desc = "Git Browse in webui", nowait = true, remap = false },
	{ "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git Browse in webui", nowait = true, remap = false },
	-- l
	{ "<leader>l", group = "LSP", nowait = true, remap = false },
	{ "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to Declaration", nowait = true, remap = false },
	{ "<leader>lF", ":FormatWrite<cr>", desc = "LSP Format and Write", nowait = true, remap = false },
	{ "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Commands", nowait = true, remap = false },
	{ "<leader>lN", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Go to previous diagnostic", nowait = true, remap = false },
	{ "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
	{ "<leader>lW", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", desc = "List Workspace folders", nowait = true, remap = false },
	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
	{ "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition", nowait = true, remap = false },
	{ "<leader>le", "<cmd>lua vim.diagnostic.open_float({scope='line'})<cr>", desc = "Show line diagnostic", nowait = true, remap = false },
	{ "<leader>lf", ":Format<cr>", desc = "LSP Format", nowait = true, remap = false },
	{ "<leader>li", ":LspInfo<cr>", desc = "LSP Info", nowait = true, remap = false },
	{ "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", nowait = true, remap = false },
	{ "<leader>ll", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition", nowait = true, remap = false },
	{ "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Go to next diagnostic", nowait = true, remap = false },
	{ "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References", nowait = true, remap = false },
	{ "<leader>lw", "<cmd>lua vim.lsp.remove_workspace_folder()<cr>", desc = "Add Workspace folder", nowait = true, remap = false },
	{ "<leader>ls", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]] },
	-- p
	{ "<leader>p", group = "Packer", nowait = true, remap = false },
	{ "<leader>pS", ":PackerStatus<cr>", desc = "Packer Status", nowait = true, remap = false },
	{ "<leader>pc", ":PackerCompile profile=true<cr>", desc = "Recompile Plugins", nowait = true, remap = false },
	{ "<leader>pi", ":PackerInstall<cr>", desc = "Install Plugins", nowait = true, remap = false },
	{ "<leader>pp", ":PackerProfile<cr>", desc = "Packer Profile", nowait = true, remap = false },
	{ "<leader>pr", ":PackerClean<cr>", desc = "Remove Unused Plugins", nowait = true, remap = false },
	{ "<leader>ps", ":PackerSync<cr>", desc = "Sync Plugins", nowait = true, remap = false },
	{ "<leader>pu", ":PackerUpdate<cr>", desc = "Update Plugins", nowait = true, remap = false },
	-- t
	{ "<leader>t", group = "Terminal", nowait = true, remap = false },
	{ "<leader>th", ":ToggleTerm direction=horizontal size=50<cr>", desc = "Split Terminal Vertically", nowait = true, remap = false },
	{ "<leader>tv", ":ToggleTerm direction=vertical size=100<cr>", desc = "Split Below", nowait = true, remap = false },
}

wk.add(mappings, opts)
