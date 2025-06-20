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
-- require("null-ls").disable("csharpier")
