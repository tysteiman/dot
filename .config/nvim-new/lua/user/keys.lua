-- use space for leader key
vim.g.mapleader = " "

-- use jk instead of escape
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- d to enter Ex
vim.api.nvim_set_keymap('n', '<leader>d', ':Ex<cr>', { noremap = true, silent = true })
