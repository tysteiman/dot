return {
  'jinzhongjia/LspUI.nvim',
  lazy = true,
  event = 'LspAttach',
  config = function()
    local ui = require('LspUI')
    ui.setup()

    local wk = require('which-key')
    wk.register({
      l = {
        name = 'LSP',
        a = { '<cmd>LspUI code_action<cr>', 'Code Action' },
        r = { '<cmd>LspUI rename<cr>', 'Rename' },
      },
    }, { prefix = '<leader>' })
  end,
}
