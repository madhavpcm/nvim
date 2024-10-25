local capabilities = vim.lsp.protocol.make_client_capabilities()
return {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = { "terraform", "tf" },
}
