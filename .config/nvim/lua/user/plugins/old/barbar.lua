return {
  'romgrk/barbar.nvim',
  dependencies = {'nvim-tree/nvim-web-devicons'},
  lazy = false,
  opts = {
    animation = false,
    auto_hide = 1,
    clickable = false,
    icons = {
      button = false,
    },
  },
  keys = {
    { '<A-,>', '<CMD>BufferPrevious<CR>', desc = 'Previous Tab', },
    { '<A-.>', '<CMD>BufferNext<CR>', desc = 'Next Tab', },
    { '<A-<>', '<CMD>BufferMovePrevious<CR>', desc = 'Move Tab Back', },
    { '<A->>', '<CMD>BufferMoveNext<CR>', desc = 'Move Tab Forward', },
  },
}
