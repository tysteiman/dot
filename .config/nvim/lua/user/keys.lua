-- use space for leader key
vim.g.mapleader = " "

local set = function(mode, key, action)
  vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true, })
end

-- use jk instead of escape
set('i', 'jk', '<esc>')

-- Quickfix
set('n', '<leader>j', '<CMD>cn<CR>')
set('n', '<leader>k', '<CMD>cp<CR>')

-- Window navigation
set('n', '<c-h>', '<CMD>wincmd h<CR>')
set('n', '<c-l>', '<CMD>wincmd l<CR>')
set('n', '<c-k>', '<CMD>wincmd k<CR>')
set('n', '<c-j>', '<CMD>wincmd j<CR>')
