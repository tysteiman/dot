vim.g.mapleader = " "

local function map(kind, lhs, rhs, opts)
    vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end

local silentnoremap = {noremap = true, silent = true}

map('i', 'jk', '<esc>', silentnoremap)
map('n', '<c-k>', ':wincmd k<CR>', silentnoremap)
map('n', '<c-j>', ':wincmd j<CR>', silentnoremap)
map('n', '<c-h>', ':wincmd h<CR>', silentnoremap)
map('n', '<c-l>', ':wincmd l<CR>', silentnoremap)
map('n', '<leader>q', ':bnext<cr>', silentnoremap)
map('n', '<leader>a', ':bprevious<cr>', silentnoremap)
