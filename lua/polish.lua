-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    wren = "wren",
  },
  filename = {
    ["Wren Script"] = "wren",
  },
  pattern = {
    ["*.wren"] = "wren",
  },
}

vim.o.conceallevel = 2

do -- TREESITTER POLISH
  local pc = require("nvim-treesitter.parsers").get_parser_configs()
  pc.wren = {
    install_info = {
      url = "https://git.sr.ht/~jummit/tree-sitter-wren",
      files = { "src/parser.c" },
      branch = "master",
      generate_requires_npm = false,
      requires_generate_from_grammar = false,
    },
    filetype = "wren",
  }
  pc.buzz = {
    install_info = {
      url = "https://github.com/buzz-language/tree-sitter-buzz",
      files = { "src/parser.c" },
      branch = "main",
      generate_requires_npm = false,
      requires_generate_from_grammar = false,
    },
    filetype = "buzz",
  }
end

vim.o.cmdheight = 1

-- fucking csharpier doesn't work so disable it or i will RIOT
-- require("null-ls").disable "csharpier"

-- Setup csharp_ls indentation settings
local lspconfig = require "lspconfig"
lspconfig.csharp_ls.setup {
  settings = {
    editor = {
      tabSize = 2,
      indentSize = 2,
      insertSpaces = false,
    },
  },
}

-- Override csharpier formatter to use correct arguments so formatting-on-save works
local null_ls_status, null_ls = pcall(require, "null-ls")
if null_ls_status then
  null_ls.register(null_ls.builtins.formatting.csharpier.with {
    command = "dotnet-csharpier",
    args = { "--write-stdout", "--no-cache" },
    filetypes = { "cs" },
  })
end

-- Set buffer-local indentation for C# files (Neovim style)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = false
  end,
})
