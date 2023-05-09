return {
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        event = "BufRead",
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    },
}
