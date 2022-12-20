local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader> ', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
