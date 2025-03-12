return {
  'jinzhongjia/LspUI.nvim',
  event = 'LspAttach',
  opts = {},
  keys = {
    { '<leader>la', '<cmd>LspUI code_action<cr>', desc = 'Code Action' },
    { '<leader>lr', '<cmd>LspUI rename<cr>', desc = 'Rename' },
  },
}
