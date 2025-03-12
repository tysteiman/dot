return {
  'folke/todo-comments.nvim',
  opts = {
    signs = false,
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]],
    },
    search = {
      pattern = [[\b(KEYWORDS)]]
    },
  },
  keys = {
    { '<leader>ft', '<CMD>TodoQuickFix<CR>', desc = 'Find TODO (QuickFix)' },
    { '<leader>fT', '<CMD>TodoTelescope<CR>', desc = 'find TODO (Telescope)' },
  },
}
