return {
  'Robitx/gp.nvim',
  name = 'ai',
  lazy = true,
  event = 'VeryLazy',
  config = function()
    require("gp").setup()

    local wk = require('which-key')

    wk.register({
      a = {
        name = 'AI',
        a = { '<CMD>GpChatNew<CR>', 'New GPT Chat' },
        d = { '<CMD>GpChatDelete<CR>', 'Delete GPT Chat' },
        f = { '<CMD>GpChatFinder<CR>', 'Find GPT Chat' },
        p = { '<CMD>GpChatPaste<CR>', 'Chat Selected Text Into GPT Chat' },
        t = { '<CMD>GpChatToggle<CR>', 'Toggle GPT Chat' },
      },
    }, { prefix = '<leader>' })
  end,
}
