return {
  "jinzhongjia/LspUI.nvim",
  lazy = true,
  event = "LspAttach",
  config = function()
    require("LspUI").setup({})

    vim.keymap.set('n', '<space>la', function()
      vim.cmd 'LspUI code_action'
    end, opts)

    vim.keymap.set('n', '<space>ld', function()
      vim.cmd 'LspUI definition'
    end, opts)

    vim.keymap.set('n', '<space>lt', function()
      vim.cmd 'LspUI type_definition'
    end, opts)

    vim.keymap.set('n', '<space>li', function()
      vim.cmd 'LspUI implementation'
    end, opts)

    vim.keymap.set('n', 'K', function()
      vim.cmd 'LspUI hover'
    end, opts)

    -- vim.keymap.set('n', '<space>ln', function()
    --   vim.cmd 'LspUI reference'
    -- end, opts)

    vim.keymap.set('n', '<space>lr', function()
      vim.cmd 'LspUI rename'
    end, opts)

    vim.keymap.set('n', ']d', function()
      vim.cmd 'LspUI diagnostic next'
    end, opts)

    vim.keymap.set('n', '[d', function()
      vim.cmd 'LspUI diagnostic prev'
    end, opts)
  end
}
