---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        csharp_ls = {
          on_attach = function(client)
            client.config.settings = client.config.settings or {}
            client.config.settings.editor = {
              tabSize = 2,
              indentSize = 2,
              insertSpaces = false,
            }
          end,
        },
      },
    },
  },
}