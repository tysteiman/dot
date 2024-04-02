return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "BufRead",
  config = function()
    require('gitsigns').setup()
  end,
}
