local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme ayu]])
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require'user.packages.treesitter'
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = false,
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                }
            }
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = false,
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        lazy = false,
        config = function()
            require('bufferline').setup{
                options = {
                    color_icons = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    always_show_bufferline = false,
                }
            }
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            require('gitsigns').setup()
        end,
    },
    {
        'folke/which-key.nvim',
        lazy = false,
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup {
                window = {
                    border = 'single',
                    position = 'top',
                },
                triggers = {"<leader>"},
            }
        end,
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            require'user.packages.lsp'
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        dependencies = {
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require'user.packages.cmp'
        end,
    },
    "lukoshkin/trailing-whitespace"
})
