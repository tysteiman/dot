return {
  'Robitx/gp.nvim',
  name = 'gpt',
  opts = {},
  keys = {
    { '<leader>an', '<CMD>GpChatNew<CR>', desc = 'New GPT Chat' },
    { '<leader>ad', '<CMD>GpChatDelete<CR>', desc = 'Delete GPT Chat' },
    { '<leader>af', '<CMD>GpChatFinder<CR>', desc = 'Find GPT Chat' },
    { '<leader>at', '<CMD>GpChatToggle<CR>', desc = 'Toggle GPT Chat' },
    { '<C-r>', '<ESC><CMD>GpRewrite<CR>', mode = 'v', desc = 'Rewrite Selected Text with GPT' },
  },
}
