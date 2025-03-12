return {
  'Robitx/gp.nvim',
  name = 'gpt',
  event = 'VeryLazy',
  config = function()
    require("gp").setup()

    local wk = require('which-key')

    wk.register({
      a = {
        name = 'AI',
        a = { '<CMD>GpChatNew<CR>', 'New GPT Chat' },
        n = { '<CMD>GpChatNew<CR>', 'New GPT Chat' },
        d = { '<CMD>GpChatDelete<CR>', 'Delete GPT Chat' },
        f = { '<CMD>GpChatFinder<CR>', 'Find GPT Chat' },
        t = { '<CMD>GpChatToggle<CR>', 'Toggle GPT Chat' },
      },
    }, { prefix = '<leader>' })
  end,
}
