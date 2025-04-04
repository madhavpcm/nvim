local vim = vim
local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  print "formatter.nvim is not installed."
  return
end
local util = require "formatter.util"

-- Format on save
vim.cmd [[
	augroup FormatAutogroup
	autocmd!
	autocmd BufWritePost * FormatWrite
	augroup END
]]

-- Formatter output
vim.cmd [[
	augroup FormatAutogroup
	autocmd!
	autocmd User FormatterPre lua print("Formatting ...")
	autocmd User FormatterPost lua print("Formatting Complete!")
	augroup END
]]

local prettierConfig = function()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath",
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
      "--single-quote",
    },
    stdin = true,
  }
end

local formatterConfig = {
  go = {
    require("formatter.filetypes.go").gofmt,
  },
  lua = {
    require("formatter.filetypes.lua").stylua,
  },
  rust = {
    require("formatter.filetypes.rust").rustfmt,
  },
  cpp = {
    require("formatter.filetypes.cpp").clangformat,
  },
  cmake = {
    require("formatter.filetypes.cmake").cmakeformat,
  },
  python = {
    require("formatter.filetypes.python").black,
    function()
      return {
        exe = "black",
        args = {
          "-q",
          "--stdin-filename",
          util.escape_path(util.get_current_buffer_file_name()),
          "-",
        },
        stdin = true,
      }
    end,
  },

  ["*"] = {
    -- require("formatter.filetypes.any").lsp_format,
    require("formatter.filetypes.any").remove_trailing_whitespace,
  },
}
local commonFT = {
  "css",
  "scss",
  "html",
  "java",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "markdown",
  "markdown.mdx",
  "json",
  "yaml",
  "xml",
  "svg",
  "svelte",
  "py",
  "sh",
}
for _, ft in ipairs(commonFT) do
  formatterConfig[ft] = { prettierConfig }
end
-- Setup
formatter.setup {
  logging = true,
  filetype = formatterConfig,
  log_level = 1,
}
