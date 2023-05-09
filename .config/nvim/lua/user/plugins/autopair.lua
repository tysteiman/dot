return {
    {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "BufRead",
        config = function()
            require('nvim-autopairs').setup()
        end,
    },
}
