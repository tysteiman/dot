return {
  'sindrets/diffview.nvim',
  lazy = true,
  event = 'BufRead',
  config = function()
    vim.keymap.set('n', '<space>gg', function()
      vim.cmd 'DiffviewOpen'
    end, opts)

    vim.keymap.set('n', '<space>gh', function()
      vim.cmd 'DiffviewFileHistory'
    end, opts)

    vim.keymap.set('n', '<space>gq', function()
      vim.cmd 'DiffviewClose'
    end, opts)
  end,
}
