-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Tree Sitter plugins
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufWinEnter",
		config = function()
			require("plugins.treesitter")
		end,
	},

	-- Completions
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.nvim-cmp")
		end,
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-omni",
			"mfussenegger/nvim-lint",
			"L3MON4D3/LuaSnip",
		},
	},

	-- LSP/Linters/Formatters
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.conform")
		end,
		event = "BufWritePre",
	},
	{ "towolf/vim-helm" },
	{ "mfussenegger/nvim-dap" },

	-- Code/Workflow
	{ "https://github.com/tpope/vim-rhubarb" },
	{
		"https://github.com/tpope/vim-fugitive",
		config = function()
			require("plugins.fugitive")
		end,
		dependencies = "tpope/vim-rhubarb",
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indentline")
		end,
		event = "BufReadPost",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins.colorizer")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.gitsigns")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs")
		end,
	},
	{ "sakhnik/nvim-gdb" },
	{ "L3MON4D3/LuaSnip" },
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.which-key")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
		cmd = "Telescope",
	},
	{
		"mbbill/undotree",
		config = function()
			require("plugins.undotree")
		end,
	},

	-- Looks and themes
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.devicons")
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.tabline")
		end,
		event = "BufWinEnter",
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.nvim-tree")
		end,
		cmd = "NvimTreeToggle",
	},
	{
		"scottmckendry/cyberdream.nvim",
		config = function()
			require("plugins.color")
		end,
	},
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("plugins.cursorline")
		end,
	},
	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"smiteshp/nvim-navic",
			"kyazdani42/nvim-web-devicons",
		},
		event = "BufWinEnter",
		config = function()
			require("plugins.barbecue")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.dashboard")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.lualine")
		end,
	},
})
