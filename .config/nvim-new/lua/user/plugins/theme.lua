return {
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          'tokyonight',
          'gruvbox',
          'onedark',
          'kanagawa',
          'monokai',
          'oxocarbon',
          'dark_flat',
        },
        themeConfigFile = "~/.config/nvim/lua/user/theme.lua",
        livePreview = true,
      })

      require('user.theme')

      vim.keymap.set("n", "<leader>T", "<CMD>Themery<CR>", { desc = "Open Themery" })
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "night",
      })
      vim.cmd[[colorscheme tokyonight]]
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      -- Default options:
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
  {
    'uncleTen276/dark_flat.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      vim.cmd [[ colorscheme dark_flat ]]
    end,
  },
  {
    'tanvirtin/monokai.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      vim.cmd [[ colorscheme monokai ]]
    end,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      vim.cmd [[ colorscheme oxocarbon ]]
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require('kanagawa').setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        }
      })
      vim.cmd [[ colorscheme kanagawa ]]
    end,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      vim.cmd [[ colorscheme onedark ]]
    end,
  },
}
