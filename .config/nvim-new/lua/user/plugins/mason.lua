return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
    vim.api.nvim_set_keymap('n', '<leader>pm', ':Mason<cr>', { noremap = true, silent = true })
  end,
}

