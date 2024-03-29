require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    sync_install = false,
    ignore_install = { "php" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    }
}
