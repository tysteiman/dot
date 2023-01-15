local ui = require('harpoon.ui')
local mark = require('harpoon.mark')

vim.keymap.set('n', '<leader>hs', ui.toggle_quick_menu, {})
vim.keymap.set('n', '<leader>ha', mark.add_file, {})

vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, {})
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, {})
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, {})
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, {})
vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end, {})
vim.keymap.set('n', '<leader>6', function() ui.nav_file(6) end, {})
vim.keymap.set('n', '<leader>7', function() ui.nav_file(7) end, {})
vim.keymap.set('n', '<leader>8', function() ui.nav_file(8) end, {})
vim.keymap.set('n', '<leader>9', function() ui.nav_file(9) end, {})

vim.keymap.set('n', '<leader>hp', ui.nav_prev, {})
vim.keymap.set('n', '<leader>hn', ui.nav_next, {})
