return {
  'b0o/lavi.nvim',
  priority = 1000,
  lazy = true,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    vim.cmd [[ colorscheme lavi ]]
  end,
}
