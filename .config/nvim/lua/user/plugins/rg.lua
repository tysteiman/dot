return {
  'duane9/nvim-rg',
  lazy = false,
  config = function()
    local wk = require('which-key')

    wk.register({
      r = {
        name = 'Ripgrep',
      },
    }, { prefix = '<leader>' })
  end,
}
