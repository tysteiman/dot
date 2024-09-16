return {
  'romgrk/barbar.nvim',
  lazy = true,
  config = function()
    require('barbar').setup({
      animation = false,
      auto_hide = 1,
      clickable = false,
      icons = {
        button = false,
      },
    })
    vim.api.nvim_set_keymap('n', '<A-,>', '<CMD>BufferPrevious<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<A-.>', '<CMD>BufferNext<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<A-<>', '<CMD>BufferMovePrevious<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<A->>', '<CMD>BufferMoveNext<CR>', { noremap = true, silent = true })
  end,
}
