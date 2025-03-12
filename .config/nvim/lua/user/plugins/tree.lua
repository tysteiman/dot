return {
  'nvim-tree/nvim-tree.lua',
  event = 'VeryLazy',
  opts = {
    view = {
      width = 45,
    },
  },
  keys = {
    { '<leader>e', '<CMD>NvimTreeFindFileToggle<CR>', desc = 'Tree' },
    { '<leader>E', '<CMD>NvimTreeFindFile<CR>', desc = 'Tree (Find File)' },
  },
}
