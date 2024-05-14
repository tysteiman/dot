return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = "BufRead",
    config = function()
      -- Setup language servers.
      local lspconfig = require('lspconfig')

      lspconfig.tsserver.setup {}
      lspconfig.intelephense.setup {}

       vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
         vim.lsp.handlers.hover, {
           border = "rounded",
           title = "Docs"
         }
       )

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>wl', function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          -- vim.keymap.set('n', '<space>lf', function()
          --   vim.lsp.buf.format { async = true }
          -- end, opts)
          local wk = require('which-key')

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

          wk.register({
            l = {
              name = 'LSP',
              a = { vim.lsp.buf.code_action, 'Code Action' },
              d = { vim.lsp.buf.definition, 'Definition' },
              t = { vim.lsp.buf.type_definition, 'Type Definition' },
              i = { vim.lsp.buf.implementation, 'Implementation' },
              n = { vim.lsp.buf.references, 'References' },
              r = { vim.lsp.buf.rename, 'Rename' },
              e = { vim.diagnostic.open_float, 'Open Diagnostic Float' },
            },
          }, { prefix = '<leader>' })
        end,
      })
    end,
  }
}
