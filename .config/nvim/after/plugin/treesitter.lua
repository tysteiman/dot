require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "ruby", "javascript", "lua", "rust", "bash", "yaml" },
    auto_install = true,
    sync_install = false,
    ignore_install = { "php" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
