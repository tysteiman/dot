return {
    {
        "nvim-lualine/lualine.nvim",
        lazy = true,
        event = "ColorScheme",
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
