local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require("lsp.handlers").setup()
-- require "lsp.nimbleparse"
require("lsp.mason")
require("lsp.rust-tools")

-- require "lsp.efm-config"
-- require "lsp.efm-langserver".setup()
-- require "lsp.null-ls"hello i
