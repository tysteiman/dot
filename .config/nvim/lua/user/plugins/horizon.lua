return {
  'LunarVim/horizon.nvim',
  lazy = true,
  priority = 1000,
  config = function()
    vim.cmd[[ colorscheme horizon ]]
  end,
}
