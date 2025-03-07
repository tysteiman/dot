return {
  'eero-lehtinen/oklch-color-picker.nvim',
  lazy = true,
  event = 'BufEnter *.css',
  config = function()
    require('oklch-color-picker').setup()
  end,
}
