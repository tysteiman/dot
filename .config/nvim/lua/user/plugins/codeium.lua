return {
  "Exafunction/codeium.nvim",
  lazy = true,
  event = 'BufRead',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      enable_chat = true,
    })
  end,
}
