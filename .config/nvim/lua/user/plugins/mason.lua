return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()

    vim.api.nvim_set_keymap('n', '<leader>pm', ':Mason<cr>', { noremap = true, silent = true })

    local wk = require('which-key')

    wk.register({
      p = {
        name = 'Plugins',
        m = { '<CMD>Mason<CR>', 'Mason' },
      },
    }, { prefix = '<leader>' })
  end,
}

