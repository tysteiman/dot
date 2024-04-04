return {
  'dmmulroy/tsc.nvim',
  lazy = true,
  event = "BufRead *.ts",
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
