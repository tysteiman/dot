return {
  'j-hui/fidget.nvim',
  lazy = true,
  event = 'LspAttach',
  config = function()
    require('fidget').setup()
  end,
}
