return {
  'duane9/nvim-rg',
  event = "VeryLazy",
  config = function()
    local wk = require('which-key')

    wk.register({
      r = {
        name = 'Ripgrep',
      },
    }, { prefix = '<leader>' })
  end,
}
