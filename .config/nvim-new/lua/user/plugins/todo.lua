return {
  'folke/todo-comments.nvim',
  lazy = true,
  event = 'BufEnter',
  config = function()
    require('todo-comments').setup({
      signs = false,
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]],
      },
      search = {
        pattern = [[\b(KEYWORDS)]]
      },
    })

    vim.keymap.set("n", "<leader>tt", "<CMD>TodoQuickFix<CR>", { desc = "Open TODOs in project in quickfix" })
    vim.keymap.set("n", "<leader>tT", "<CMD>TodoTelescope<CR>", { desc = "Open TODOs in project in telescope" })
  end,
}
