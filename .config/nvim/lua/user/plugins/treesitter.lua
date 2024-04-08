return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "BufRead",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = {},
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        disable = {"php"},
        additional_vim_regex_highlighting = false,
      },
    }

    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldenable = false

  end,
}
