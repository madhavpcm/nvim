local status_ok, conform = pcall(require, "conform")
if not status_ok then
  print "conform.nvim is not installed."
  return
end

conform.setup {
  formatters_by_ft = {
    markdown = { "markdownft" },
    go = { "gofmt" },
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    conform.format { bufnr = args.buf }
  end,
})
