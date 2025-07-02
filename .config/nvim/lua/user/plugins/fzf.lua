return {
  'ibhagwan/fzf-lua',
  opts = {},
  keys = {
    -- files
    { '<leader>fb', '<cmd>FzfLua buffers<cr>' },
    { '<leader>ff', '<cmd>FzfLua files<cr>' },
    { '<leader>fg', '<cmd>FzfLua grep<cr>' },
    { '<leader>fr', '<cmd>FzfLua resume<cr>' },
    { '<leader>fs', '<cmd>FzfLua live_grep<cr>' },
    -- lsp
    { '<leader>ld', '<cmd>FzfLua lsp_document_symbols<cr>' },
    { '<leader>le', '<cmd>FzfLua lsp_document_diagnostics<cr>' },
    { '<leader>lr', '<cmd>FzfLua lsp_references<cr>' },
    { '<leader>lw', '<cmd>FzfLua lsp_workspace_symbols<cr>' },
  },
}
