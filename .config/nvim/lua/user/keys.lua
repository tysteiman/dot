-- use space for leader key
vim.g.mapleader = " "

-- use jk instead of escape
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- Kakoune keys
vim.api.nvim_set_keymap('n', 'gh', '0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gl', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gt', 'H', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gb', 'L', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ge', 'G', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gc', 'M', { noremap = true, silent = true })

-- Enter directory of file
vim.api.nvim_set_keymap('n', '<leader>d', ':Ex<cr>', { noremap = true, silent = true })
