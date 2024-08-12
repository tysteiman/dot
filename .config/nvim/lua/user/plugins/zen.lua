return {
  'folke/zen-mode.nvim',
  lazy = true,
  event = 'BufEnter',
  opts = {
    window = {
      width = .60,
    },
    plugins = {
      tmux = { enabled = true },
    },
  },
}
