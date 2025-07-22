return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')
    ts.setup()
    ts.install {
      'javascript',
      'typescript',
      'ruby',
    }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'javascript',
        'javascriptreact',
        'ruby',
      },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
