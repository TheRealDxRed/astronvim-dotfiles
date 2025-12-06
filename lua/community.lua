-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.pack.cs-omnisharp" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.godot" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.zig" },
  -- { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  -- import/override with your plugins folder
}
