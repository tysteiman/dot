return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "moon",
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
    lazy = true,
    config = function()
      vim.cmd [[ colorscheme dark_flat ]]
    end,
  },
  {
    'tanvirtin/monokai.nvim',
    lazy = true,
    config = function()
      vim.cmd [[ colorscheme monokai ]]
    end,
  }
}

