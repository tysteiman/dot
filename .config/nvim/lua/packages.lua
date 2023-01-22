require('packer').startup(function()
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Theme
    -- use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Emmet
    use 'mattn/emmet-vim'

    -- Prettier
    use 'prettier/vim-prettier'

    -- Whitespace
    use 'ntpeters/vim-better-whitespace'

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

    -- Lualine
    use 'nvim-lualine/lualine.nvim'

    -- Bufferline
    use 'akinsho/bufferline.nvim'

    -- Blade
    use 'jwalton512/vim-blade'

    -- Slim
    use 'slim-template/vim-slim'

    -- Org
    use 'nvim-orgmode/orgmode'

    -- Git signs
    use 'lewis6991/gitsigns.nvim'
end)
