return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      -- Basic Navigation
      vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fF', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

      -- LSP
      vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, {})
      vim.keymap.set('n', '<leader>ls', builtin.lsp_workspace_symbols, {})
      vim.keymap.set('n', '<leader>lS', builtin.lsp_document_symbols, {})
    end,
  }
}
