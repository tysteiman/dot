return {
  'brenoprata10/nvim-highlight-colors',
  lazy = true,
  event = 'BufEnter *.css',
  config = function()
    require('nvim-highlight-colors').setup()
  end,
}
