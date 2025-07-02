return {
  'xiyaowong/transparent.nvim',
  lazy = true,
  config = function()
    require('transparent').setup()
    vim.cmd('TransparentEnable')
  end,
}
