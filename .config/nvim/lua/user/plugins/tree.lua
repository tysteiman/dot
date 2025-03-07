return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 45,
      },
    })
    vim.api.nvim_set_keymap('n', '<leader>e', '<CMD>NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>E', '<CMD>NvimTreeFindFile<CR>', { noremap = true, silent = true })
  end,
}
