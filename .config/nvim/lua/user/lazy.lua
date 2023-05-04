local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "Shatur/neovim-ayu",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme ayu]])
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require'user.packages.treesitter'
        end,
    },
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
    "lukoshkin/trailing-whitespace"
})
