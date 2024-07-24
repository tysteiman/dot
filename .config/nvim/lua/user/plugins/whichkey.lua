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
      notify = false,
      win = {
        border = 'single',
      },
      icons = {
        mappings = false,
      },
    })

    wk.register({
      b = {
        name = 'Tabs',
        b = { function() vim.cmd('tabnew') end, 'New Tab' },
        n = { function() vim.cmd('tabnext') end, 'Next Tab' },
        p = { function() vim.cmd('tabprevious') end, 'Previous Tab' },
        q = { function() vim.cmd('tabclose') end, 'New Tab' },
        o = { function() vim.cmd('tabonly') end, 'Close All Other Tabs' },
      },
      p = {
        name = 'Plugins',
        p = { '<CMD>Lazy<CR>', 'Lazy' },
        s = { '<CMD>Lazy sync<CR>', 'Lazy Sync' },
      },
      J = { '<CMD>%!cat % | jq --sort-keys<CR>', 'Sort JSON by keys' },
    }, { prefix = '<leader>' })
  end,
}
