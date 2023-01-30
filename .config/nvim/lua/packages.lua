require('packer').startup(function()
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Theme
    -- use 'folke/tokyonight.nvim'
    -- use 'navarasu/onedark.nvim'
    use 'Shatur/neovim-ayu'
    -- use 'ellisonleao/gruvbox.nvim'

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

    -- Fzf
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Transparency lol
    -- use 'xiyaowong/nvim-transparent'
end)

require('ayu').colorscheme()
