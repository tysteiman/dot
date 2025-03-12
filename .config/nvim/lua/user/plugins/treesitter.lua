return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "BufEnter",
  opts = {
    ensure_installed = {},
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
      enable = true,
      disable = {"php"},
      additional_vim_regex_highlighting = false,
    },
  },
}
