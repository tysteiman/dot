return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')

    local wk = require('which-key')

    wk.register({
      f = {
        name = 'Find',
        f = { builtin.git_files, 'Git Files' },
        F = { builtin.find_files, 'All Files' },
        g = { builtin.live_grep, 'Grep' },
        b = { builtin.buffers, 'Buffers' },
      },
      l = {
        name = 'LSP',
        s = { builtin.lsp_document_symbols, 'Document Symbols' },
        S = { builtin.lsp_workspace_symbols, 'Workspace Symbols' },
      },
    }, { prefix = '<leader>' })

    local telescope = require('telescope')

    telescope.setup {
      defaults = {
        layout_strategy = "center",
        layout_config = {
          width = 0.4,
          height = 0.3,
          prompt_position = "top",
        },
        preview = false,
        previewer = false,
        sorting_strategy = "ascending",
      }
    }
  end,
}
