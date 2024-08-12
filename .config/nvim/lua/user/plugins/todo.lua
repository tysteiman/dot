return {
  'folke/todo-comments.nvim',
  lazy = true,
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
      t = {
        name = 'Todos',
        t = { '<CMD>TodoQuickFix<CR>', 'View (QuickFix)' },
        T = { '<CMD>TodoTelescope<CR>', 'View (Telescope)' },
      },
    }, { prefix = '<leader>' })
  end,
}
