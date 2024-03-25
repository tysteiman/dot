return {
  'dmmulroy/tsc.nvim',
  lazy = true,
  event = "BufEnter *.ts",
  config = function()
    require('tsc').setup()
  end,
}
