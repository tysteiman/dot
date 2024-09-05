return {
  'windwp/nvim-ts-autotag',
  lazy = true,
  event = {
    'BufRead *.tsx',
    'BufRead *.jsx',
    'BufRead *.html',
    'BufRead *.php',
  },
  config = function()
    require('nvim-ts-autotag').setup({})
  end,
}
