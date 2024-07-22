return {
  'rebelot/kanagawa.nvim',
  lazy = true,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    })

    vim.cmd("colorscheme kanagawa")
  end,
}
