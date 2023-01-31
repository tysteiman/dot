require('nvim-tree').setup{
    view = {
        width = 50,
    }
}

vim.keymap.set('n', '<leader>n', ":NvimTreeToggle<cr>", {})
vim.keymap.set('n', '<leader>N', ":NvimTreeFindFile<cr>", {})
