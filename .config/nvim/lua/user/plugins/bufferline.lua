return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        lazy = true,
        event = "BufRead",
        config = function()
            require('bufferline').setup{
                options = {
                    color_icons = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    always_show_bufferline = false,
                }
            }
        end,
    },
}
