return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      width = .60,
    },
    plugins = {
      tmux = { enabled = true },
    },
  },
  keys = { { '<leader>z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' } },
}
