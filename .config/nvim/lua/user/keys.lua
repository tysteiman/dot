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

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope git_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>F', ':Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', ':Telescope grep_string<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<cr>', { noremap = true, silent = true })
