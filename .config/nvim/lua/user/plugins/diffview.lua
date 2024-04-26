return {
  'sindrets/diffview.nvim',
  config = function()
    local wk = require('which-key')

    wk.register({
      g = {
        name = 'Diff View',
        g = { '<CMD>DiffviewOpen<CR>', 'Open', },
        h = { '<CMD>DiffviewFileHistory<CR>', 'File History', },
        q = { '<CMD>DiffviewClose<CR>', 'Close', },
      },
    }, { prefix = '<leader>' })
  end,
}
