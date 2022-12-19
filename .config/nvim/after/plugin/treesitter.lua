require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "ruby", "javascript", "php", "lua", "rust" },
    auto_install = true,
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
