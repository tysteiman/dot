return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = false,
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                }
            }
        end
    },
}
