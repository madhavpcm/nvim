-- Consolidated LSP Setup
-- Uses vim.lsp.enable with configs from nvim/lsp directory

-- Mason setup for package management
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local masonlspc_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not masonlspc_status_ok then
  return
end

mason.setup {
  ui = {
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "bashls",
    "clangd",
    "rust_analyzer",
    "pyright",
    "jsonls",
    "cmake",
    "gopls",
    "terraformls",
    "tflint",
    "helm_ls",
    "intelephense",
    "eslint",
  },
  automatic_installation = true,
}

-- Auto-enable all servers from lua/lsp-servers directory
local function setup_lsp()
  local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp-servers"
  local lsp_servers = {}

  if vim.fn.isdirectory(lsp_dir) == 1 then
    for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
      if file:match("%.lua$") and file ~= "init.lua" then
        local server_name = file:gsub("%.lua$", "")
        table.insert(lsp_servers, server_name)
      end
    end
  end

  vim.lsp.enable(lsp_servers)
end

setup_lsp()
