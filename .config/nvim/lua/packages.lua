require('packer').startup(function()
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Theme
    use 'navarasu/onedark.nvim'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Emmet
    use 'mattn/emmet-vim'

    -- Prettier
    use 'prettier/vim-prettier'

    -- Whitespace
    use 'ntpeters/vim-better-whitespace'

    -- Git
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    -- LSP
    use 'neovim/nvim-lspconfig'
end)
