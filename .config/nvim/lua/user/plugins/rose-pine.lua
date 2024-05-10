return {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = true,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      styles = {
        italic = false,
      },
    })

    vim.cmd "colorscheme rose-pine"
  end,
}
