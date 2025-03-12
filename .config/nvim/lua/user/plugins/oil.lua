return {
  'stevearc/oil.nvim',
  event = "VeryLazy",
  opts = {
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 5,
      max_width = 75,
      max_height = 200,
    }
  },
  keys = { { '-', '<cmd>Oil --float<cr>', desc = 'Oil' } },
}
