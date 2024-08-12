return {
  'folke/zen-mode.nvim',
  lazy = true,
  event = 'VeryLazy',
  opts = {
    window = {
      width = .60,
    },
    plugins = {
      tmux = { enabled = true },
    },
  },
}
