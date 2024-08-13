return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  event = "VeryLazy",
  config = function()
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    local wk = require('which-key')

    wk.register({
      f = {
        name = 'Find',
        f = { builtin.git_files, 'Git Files' },
        F = { builtin.find_files, 'All Files' },
        g = { builtin.live_grep, 'Grep' },
        -- g = { function()
        --   builtin.live_grep(themes.get_ivy({}))
        -- end, 'Grep' },
        b = { builtin.buffers, 'Buffers' },
      },
      l = {
        name = 'LSP',
        s = { builtin.lsp_document_symbols, 'Document Symbols' },
        S = { builtin.lsp_workspace_symbols, 'Workspace Symbols' },
        N = { builtin.lsp_references, 'References (Telescope)' },
      },
    }, { prefix = '<leader>' })

    local telescope = require('telescope')

    local center_layout = {
      width = 0.5,
      height = 0.6,
      prompt_position = "top",
    }

    local custom_picker = {
      preview = false,
      previewer = false,
      layout_strategy = "center",
      layout_config = center_layout,
    }

    telescope.setup({
      defaults = {
        layout_config = {
          width = 0.9,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
      pickers = {
        git_files = custom_picker,
        find_files = custom_picker,
        buffers = custom_picker,
      },
    })

    -- telescope.setup {
    --   defaults = {
    --     layout_strategy = "center",
    --     layout_config = {
    --       width = 0.4,
    --       height = 0.3,
    --       prompt_position = "top",
    --     },
    --     preview = false,
    --     previewer = false,
    --     sorting_strategy = "ascending",
    --   }
    -- }
  end,
}
