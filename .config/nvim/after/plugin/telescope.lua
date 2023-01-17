local builtin = require('telescope.builtin')

-- default options to be passed into pickers we want to customize
local default_layout = {
    layout_strategy = 'vertical',
    layout_config = {
        width = 0.333,
        height = 0.4
    },
    previewer = false
}

vim.keymap.set('n', '<leader>f', function()
    builtin.git_files(default_layout)
end, {})

vim.keymap.set('n', '<leader>F', function()
    builtin.find_files(default_layout)
end, {})

vim.keymap.set('n', '<leader>b', function()
    builtin.buffers(default_layout)
end, {})

vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>s', builtin.current_buffer_fuzzy_find, {})
