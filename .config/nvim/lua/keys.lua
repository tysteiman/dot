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
map('n', '<leader>d', ':Ex<cr>', silentnoremap)
map('n', '<leader>.', ':bn<cr>', silentnoremap)
map('n', '<leader>,', ':bp<cr>', silentnoremap)

-- TODO move into own file if possible...
-- Fzf keys (not lua)
vim.keymap.set('n', '<leader>f', ":GitFiles<CR>", {})
vim.keymap.set('n', '<leader>F', ":Files<CR>", {})
vim.keymap.set('n', '<leader>b', ":Buffers<CR>", {})
vim.keymap.set('n', '<leader>g', ":Rg<CR>", {})
