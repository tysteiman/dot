return {
  'williamboman/mason.nvim',
  lazy = true,
  event = "VeryLazy",
  config = function()
    require('mason').setup()
  end,
}
