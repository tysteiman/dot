vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.laststatus = 2
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true

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
map('n', '<leader>ff', '<cmd>Telescope git_files<cr>', silentnoremap)
map('n', '<leader> ', '<cmd>Telescope git_files<cr>', silentnoremap)
map('n', '<leader>gg', '<cmd>Telescope live_grep<cr>', silentnoremap)
map('n', '<leader>ss', '<cmd>Telescope current_buffer_fuzzy_find<cr>', silentnoremap)
map('n', '<leader>bb', '<cmd>Telescope buffers<cr>', silentnoremap)
map('n', '<leader>vv', ':e $MYVIMRC<cr>', silentnoremap)
map('n', '<leader>q', ':bnext<cr>', silentnoremap)
map('n', '<leader>a', ':bprevious<cr>', silentnoremap)


require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'sheerun/vim-polyglot'
    use 'navarasu/onedark.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'
    use 'mattn/emmet-vim'
    use 'ntpeters/vim-better-whitespace'
    use 'prettier/vim-prettier'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "ruby", "javascript", "php", "lua" },
    sync_install = false,
    highlight = {
        enable = true,
        disable = {"php"} -- right now the php syntax is broken for some reason...
    }
}

require('onedark').load()

vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'

vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
