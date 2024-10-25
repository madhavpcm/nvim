-- Mason package manager used to manage all lspconfig supported language server
-- :Mason to install servers. Have a server configs in settings/server_name.lua
local lspc_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspc_status_ok then
  print "lspconfig not found"
  return
end
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  print "mason not found"
  return
end
local masonlspc_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not masonlspc_status_ok then
  print "mason-lspconfig not found"
  return
end

local servers = {
  "lua_ls",
  "clangd",
  "rust_analyzer",
  "pyright",
  "jsonls",
  "cmake",
  "gopls",
  -- "golangci_lint_ls",
  "terraformls",
  "tflint",
  "helm_ls",
  "intelephense",
  "eslint",
}

-- Mason UI settings
local settings = {
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

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local opts = {}

-- Iterate all servers in lsp.settings.*
for _, server in pairs(servers) do
  -- customize on_attach for each server in lsp.handlers
  opts = {
    on_attach = require("lsp.handlers").on_attach,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "lsp.server_settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
