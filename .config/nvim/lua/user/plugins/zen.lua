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
  keys = { { '<leader>Z', '<cmd>ZenMode<cr>', desc = 'Zen Mode' } },
}
