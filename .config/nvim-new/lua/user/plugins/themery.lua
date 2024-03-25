return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        'tokyonight',
        'gruvbox',
        'dark_flat',
        'monokai',
        'oxocarbon',
        'kanagawa',
      }, -- Your list of installed colorschemes
      themeConfigFile = "~/.config/nvim/lua/user/theme.lua", -- Described below
      livePreview = true, -- Apply theme while browsing. Default to true.
    })

    require('user.theme')

    vim.keymap.set("n", "<leader>t", "<CMD>Themery<CR>", { desc = "Open Themery" })
  end,
}
