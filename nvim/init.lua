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
vim.opt.number = false
vim.opt.cursorline = true

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
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', silentnoremap)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', silentnoremap)
map('n', '<leader>fc', '<cmd>Telescope git_commits<cr>', silentnoremap)
map('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', silentnoremap)
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
    -- use 'neovim/nvim-lspconfig'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-cmdline'
    -- use 'hrsh7th/nvim-cmp'
    -- use 'L3MON4D3/LuaSnip'
    -- use 'saadparwaiz1/cmp_luasnip'
end)

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "ruby", "javascript", "php", "lua" },
    sync_install = false,
    highlight = {
        enable = true
    }
}

require('onedark').load()

vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'

vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0

-- Setup nvim-cmp.
-- local cmp = require'cmp'
-- 
-- cmp.setup({
--     snippet = {
--         -- REQUIRED - you must specify a snippet engine
--         expand = function(args)
--             -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--             require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--             -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--             -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--         end,
--     },
--     window = {
--         -- completion = cmp.config.window.bordered(),
--         -- documentation = cmp.config.window.bordered(),
--     },
--     mapping = cmp.mapping.preset.insert({
--         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.abort(),
--         ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     }),
--     sources = cmp.config.sources({
--         { name = 'nvim_lsp' },
--         { name = 'vsnip' }, -- For vsnip users.
--         -- { name = 'luasnip' }, -- For luasnip users.
--         -- { name = 'ultisnips' }, -- For ultisnips users.
--         -- { name = 'snippy' }, -- For snippy users.
--     }, {
--             { name = 'buffer' },
--         })
-- })
-- 
-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--             { name = 'buffer' },
--         })
-- })
-- 
-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = 'buffer' }
--     }
-- })
-- 
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--             { name = 'cmdline' }
--         })
-- })
-- 
-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['solargraph'].setup {
--     capabilities = capabilities
-- }


