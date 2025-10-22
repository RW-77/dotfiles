return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Ensure it's loaded on startup
    priority = 1000, -- Ensure it loads first
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      tokyonight.load() -- Explicitly load TokyoNight
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_italics = true,
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end
  },

  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 500,
    config = function()
    require('nordic').setup({
    [[
    transparent = {
    bg = false,
    float = false,
    }
    ]]
    })
    end
  },
  {
    "navarasu/onedark.nvim",
    -- priority = 500, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      -- Enable theme
      -- require('onedark').load()
    end
  },
}
