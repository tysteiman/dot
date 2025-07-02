return {
  {
    'neovim/nvim-lspconfig',
    event = "BufEnter",
    config = function()
      local lspconfig = require('lspconfig')
      local langs = require('user.lsp')

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = "rounded",
          title = "Docs"
        }
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }
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
            F = { function() vim.lsp.buf.format() end, 'Format Buffer with LSP' },
          }, { prefix = '<leader>' })
        end,
      })
    end,
  }
}
