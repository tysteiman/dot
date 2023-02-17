require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "bash", "ruby", "javascript", "lua", "yaml", "dockerfile", "c" },
    auto_install = true,
    sync_install = false,
    ignore_install = { "php" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    }
}
