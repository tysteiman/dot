return {
  'athar-qadri/scratchpad.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' }, -- don't forget to add this one if you don't have it yet!
  config = function()
    require('scratchpad').setup({
      settings = {
        sync_on_ui_close = true,
      },
    })
    vim.api.nvim_set_keymap('n', '<leader>s', '<CMD>Scratch<CR>', { noremap = true, silent = true })
  end,
}
