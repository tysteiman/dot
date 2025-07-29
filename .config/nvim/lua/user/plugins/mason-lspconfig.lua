return {
  "mason-org/mason-lspconfig.nvim",
  event = "VeryLazy",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "intelephense",
      "ts_ls",
      "emmet_language_server",
    },
  },
  keys = {
    { '<leader>la', vim.lsp.buf.code_action },
    { '<leader>li', vim.lsp.buf.implementation },
    { '<leader>ld', vim.lsp.buf.definition },
    { '<leader>lr', vim.lsp.buf.rename },
  },
}
