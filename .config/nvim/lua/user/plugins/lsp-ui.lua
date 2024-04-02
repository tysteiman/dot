return {
  "jinzhongjia/LspUI.nvim",
  lazy = true,
  event = "LspAttach",
  config = function()
    require("LspUI").setup({})

    local wk = require('which-key')

    vim.keymap.set('n', 'K', function()
      vim.cmd 'LspUI hover'
    end, opts)

    vim.keymap.set('n', ']d', function()
      vim.cmd 'LspUI diagnostic next'
    end, opts)

    vim.keymap.set('n', '[d', function()
      vim.cmd 'LspUI diagnostic prev'
    end, opts)

    wk.register({
      l = {
        name = 'LSP',
        a = {
          function()
            vim.cmd 'LspUI code_action'
          end,
          'Code Actions'
        },
        d = {
          function()
            vim.cmd 'LspUI definition'
          end,
          'Definition'
        },
        t = {
          function()
            vim.cmd 'LspUI type_definition'
          end,
          'Type Definition'
        },
        i = {
          function()
            vim.cmd 'LspUI implementation'
          end,
          'Implementation'
        },
        r = {
          function()
            vim.cmd 'LspUI rename'
          end,
          'Rename'
        },
      },
    }, { prefix = '<leader>' })
  end
}
