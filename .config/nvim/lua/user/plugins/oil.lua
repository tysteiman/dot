return {
  'stevearc/oil.nvim',
  event = "VeryLazy",
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 5,
        max_width = 75,
        max_height = 200,
      }
    })

    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Oil - Parent Directory" })
  end,
}
