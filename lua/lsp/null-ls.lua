local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

vim.cmd "syntax enable"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"

local lsp_format = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end
local on_attach_format = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    -- format on save
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        lsp_format(bufnr)
      end,
      desc = "[lsp] format on save",
    })
  end
end

null_ls.setup {
  debug = false,
  sources = {
    null_ls.builtins.formatting.rustfmt,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    null_ls.builtins.formatting.prettierd.with {
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/nvim/prettierrc.json",
      },
    },
    null_ls.builtins.code_actions.cspell,
  },
  on_attach = function(bufnr, client)
    on_attach_format(bufnr, client)
  end,
}
