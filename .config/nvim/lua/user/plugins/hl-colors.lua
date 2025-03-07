return {
  'brenoprata10/nvim-highlight-colors',
  lazy = true,
  event = {'BufEnter *.css', 'BufEnter *.scss'},
  config = function()
    require('nvim-highlight-colors').setup()
  end,
}
