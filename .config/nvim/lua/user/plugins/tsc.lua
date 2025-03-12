return {
  'dmmulroy/tsc.nvim',
  event = {
    "BufEnter *.ts",
    "BufEnter *.tsx",
  },
  config = function()
    require('tsc').setup()

    local wk = require('which-key')
    wk.register({
      c = {
        name = 'Linting',
        t = { '<CMD>TSC<CR>', 'Run tsc (TS)' },
      },
    }, { prefix = '<leader>' })
  end,
}
