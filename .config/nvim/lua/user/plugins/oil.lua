return {
  'stevearc/oil.nvim',
  lazy = false,
  config = function()
    require("oil").setup({
      float = {
        padding = 5,
        max_width = 75,
        max_height = 200,
      }
    })

    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Oil - Parent Directory" })
  end,
}
