return {
  'folke/zen-mode.nvim',
  lazy = true,
  event = 'BufRead',
  opts = {
    window = {
      width = .60,
    },
    plugins = {
      tmux = { enabled = true },
    },
  },
}
