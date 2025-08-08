---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        csharp_ls = {
          settings = {
            editor = {
              tabSize = 2,
              indentSize = 2,
              insertSpaces = false,
            },
          },
        },
      },
    },
  },
}