---@type LazySpec
return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "                    .   .xXXXX+.   .                    ",
        "               .   ..   xXXXX+.-   ..   .               ",
        "         .   ..  ... ..xXXXX+. --.. ...  ..   .         ",
        "     .   ..  ... .....xXXXX+.  -.-..... ...  ..   .     ",
        "   .   ..  ... ......xXXXX+.  . .--...... ...  ..   .   ",
        "  .   ..  ... ......xXXXX+.    -.- -...... ...  ..   .  ",
        " .   ..  ... ......xXXXX+.   .-+-.-.-...... ...  ..   . ",
        " .   ..  ... .....xXXXX+. . --xx+.-.--..... ...  ..   . ",
        ".   ..  ... .....xXXXX+. - .-xxxx+- .-- .... ...  ..   .",
        " .   ..  ... ...xXXXX+.  -.-xxxxxx+ .---... ...  ..   . ",
        " .   ..  ... ..xXXXX+. .---..xxxxxx+-..--.. ...  ..   . ",
        "  .   ..  ... xXXXX+. . --....xxxxxx+  -.- ...  ..   .  ",
        "   .   ..  ..xXXXX+. . .-......xxxxxx+-. --..  ..   .   ",
        "     .   .. xXXXXXXXXXXXXXXXXXXXxxxxxx+. .-- ..   .     ",
        "         . xXXXXXXXXXXXXXXXXXXXXXxxxxxx+.  -- .         ",
        "           xxxxxxxxxxxxxxxxxxxxxxxxxxxxx+.--            ",
        "            xxxxxxxxxxxxxxxxxxxxxxxxxxxxx+-             ",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "Mythos-404/xmake.nvim",
    branch = "v1",
    lazy = true,
    event = "BufReadPost xmake.lua",
    config = true,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "school",
          path = "~/vaults/work",
        },
        {
          name = "docs",
          path = "~/vaults/docs",
        },
      },
      ui = {
        checkboxes = {
          [" "] = { char = "", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "", hl_group = "ObsidianTilde" },
          ["!"] = { char = "", hl_group = "ObsidianTilde" },
        },
        bullets = { char = "", hl_group = "ObsidianBullet" },
        extenal_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function(_, opts)
      opts.override_by_extension = {
        ["odin"] = {
          icon = "󰆥",
          color = "#18406a",
          name = "Odin",
        },
      }
    end,
  },
}
