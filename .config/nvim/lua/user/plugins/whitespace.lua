return {
  'johnfrankmorgan/whitespace.nvim',
  lazy = true,
  event = 'BufRead',
  config = function()
    -- setup
    local ws = require('whitespace-nvim')
    ws.setup()

    -- whichkey
    local wk = require('which-key')
    wk.register({
      w = {
        name = 'Whitespace',
        t = { ws.trim, 'Trim whitespace' },
      },
    }, { prefix = '<leader>' })
  end,
}
