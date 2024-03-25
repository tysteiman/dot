-- use space for leader key
vim.g.mapleader = " "

-- use jk instead of escape
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })
