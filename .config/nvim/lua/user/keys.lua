-- use space for leader key
vim.g.mapleader = " "

-- use jk instead of escape
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- Quickfix
vim.api.nvim_set_keymap('n', '<leader>j', '<CMD>cn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<CMD>cp<CR>', { noremap = true, silent = true })
