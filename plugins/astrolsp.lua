local util = require "lspconfig.util"

return {
  "AstroNvim/astrolsp",
  opts = {
    gdscript = {
      cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
      filetypes = { "gd", "gdscript", "gdscript3" },
      root_dir = util.root_pattern("project.godot", ".git")
    },
    gdshader_lsp = {
      cmd = { "gdshader-lsp", "--stdio" },
      filetypes = { "gdshader", "gdshaderinc" },
      root_dir = util.root_pattern("project.godot", ".git"),
    },
    zls = {
      cmd = { "zls" },
      filetypes = { "zig", "zon" },
      root_dir = util.root_pattern("build.zig", "build.zig.zon"),
    },
  }
}
