return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  priority = 1000,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
  config = function()
    local wk = require('which-key')

    wk.setup({
      window = {
        border = 'single',
      },
    })

    wk.register({
      p = {
        name = 'Plugins',
        p = { '<CMD>Lazy<CR>', 'Lazy' },
        s = { '<CMD>Lazy sync<CR>', 'Lazy Sync' },
      },
    }, { prefix = '<leader>' })
  end,
}
