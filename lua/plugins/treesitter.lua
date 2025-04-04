local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  print "nvim-treesitter not found"
  return
end

nvim_treesitter.setup {
  ensure_installed = {
    "html",
    "css",
    "javascript",
    "c",
    "cpp",
    "rust",
    "lua",
    "vimdoc",
    "luadoc",
    "vim",
    "lua",
    "markdown",
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autopairs = {
    enable = true,
  },
}
