-- Override for csharp_ls under astrocommunity.pack.cs
local csharp_ls = require('lspconfig').csharp_ls

csharp_ls.setup {
    on_attach = function(client)
        client.config.settings = client.config.settings or {}
        client.config.settings.editor = {
            tabSize = 2,
            indentSize = 2,
            insertSpaces = false,
        }
    end,
}