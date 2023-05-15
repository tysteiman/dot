return {
    {
        "Shatur/neovim-ayu",
        lazy = false,
        config = function()
            require('ayu').colorscheme()
        end
    },
    -- { "folke/tokyonight.nvim", lazy = true, },
    -- { "Shatur/neovim-ayu", lazy = true, },
    -- { "ellisonleao/gruvbox.nvim", lazy = true, },
    -- { "Mofiqul/vscode.nvim", lazy = true, },
    -- { "neanias/everforest-nvim", lazy = true, },
    -- { "rose-pine/neovim", lazy = true, name = "rose-pine" },
}
