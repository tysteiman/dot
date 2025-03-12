return {
  'windwp/nvim-ts-autotag',
  lazy = true,
  event = {
    'BufRead *.tsx',
    'BufRead *.jsx',
    'BufRead *.html',
    'BufRead *.php',
  },
  opts = {},
}
