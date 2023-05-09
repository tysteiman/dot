return {
    {
        "mrjones2014/nvim-ts-rainbow",
        lazy = true,
        event = "BufRead",
        config = function()
            require('nvim-treesitter.configs').setup {
                rainbow = {
                    enable = true,
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                },
            }
        end,
    },
}
