return {
    {
        'folke/which-key.nvim',
        lazy = true,
        keys = "<space>", -- don't need until we hit space and wait... hitting a key before the timeout keeps it from loading.
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
}
