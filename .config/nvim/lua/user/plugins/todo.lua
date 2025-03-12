return {
  'folke/todo-comments.nvim',
  event = 'BufEnter',
  config = function()
    require('todo-comments').setup({
      signs = false,
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]],
      },
      search = {
        pattern = [[\b(KEYWORDS)]]
      },
    })

    local wk = require('which-key')

    wk.register({
      f = {
        t = { '<CMD>TodoQuickFix<CR>', 'Find TODO (QuickFix)' },
        T = { '<CMD>TodoTelescope<CR>', 'find TODO (Telescope)' },
      },
    }, { prefix = '<leader>' })
  end,
}
