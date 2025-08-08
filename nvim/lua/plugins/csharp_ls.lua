return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      csharp_ls = {
        settings = {
          editor = {
            tabSize = 2,
            indentSize = 2,
            insertSpaces = true,
          },
        },
        on_attach = function(client, bufnr)
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.expandtab = true
        end,
      },
    },
  },
}