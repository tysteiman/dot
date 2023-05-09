return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = "BufRead", -- don't need until read file
        config = function()
            require('gitsigns').setup()
        end,
    },
}
