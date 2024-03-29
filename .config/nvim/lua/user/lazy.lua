-- Install and set up Lazy
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

require('lazy').setup('user.plugins')

vim.api.nvim_set_keymap('n', '<leader>pp', ':Lazy<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':Lazy sync<cr>', { noremap = true, silent = true })
