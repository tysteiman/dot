return {
  'neanias/everforest-nvim',
  name = 'everforest',
  priority = 1000,
  lazy = true,
  config = function()
    require('everforest').setup({
      -- soft, medium, hard
      background = "medium",
    })

    vim.cmd [[ colorscheme everforest ]]
  end
}
