-- use space for leader key
vim.g.mapleader = " "

-- use jk instead of escape
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- Quickfix
vim.api.nvim_set_keymap('n', '<leader>j', '<CMD>cn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<CMD>cp<CR>', { noremap = true, silent = true })

-- Window navigation
vim.api.nvim_set_keymap('n', '<c-h>', '<CMD>wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<CMD>wincmd l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<CMD>wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<CMD>wincmd j<CR>', { noremap = true, silent = true })
