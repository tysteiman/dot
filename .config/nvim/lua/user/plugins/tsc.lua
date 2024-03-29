return {
  'dmmulroy/tsc.nvim',
  lazy = true,
  event = "BufRead *.ts",
  config = function()
    require('tsc').setup()
  end,
}
