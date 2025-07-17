return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  opts = {},
  keys = {
    { "<leader>gb", "<cmd>Gitsigns blame<cr>" },
    { "<leader>gl", "<cmd>Gitsigns blame_line<cr>" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>" },
  },
}
