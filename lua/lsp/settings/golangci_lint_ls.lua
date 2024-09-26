return {
	filetypes = {'go','gomod'},
	cmd = { "golangci-lint-langserver"},
	init_options = { command = { "golangci-lint", "run", "--out-format", "json"} },
	root_dir = require("lspconfig/util").root_pattern('.golangci.yml', '.golangci.yaml', '.golangci.toml', '.golangci.json', 'go.work', 'go.mod', '.git')
}
