require('packer').startup(function()
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Emmet
    use 'mattn/emmet-vim'

    -- Prettier
    use 'prettier/vim-prettier'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- CMP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Blade
    use 'jwalton512/vim-blade'

    -- Slim
    use 'slim-template/vim-slim'

    -- Git signs
    use 'lewis6991/gitsigns.nvim'

    -- Fugitive (only for blame)
    use 'tpope/vim-fugitive'

    -- Telescope
    use  'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Bufferline
    use 'akinsho/bufferline.nvim'

    -- Theme
    use 'rose-pine/neovim'

    -- Lualine
    use 'nvim-lualine/lualine.nvim'
end)
