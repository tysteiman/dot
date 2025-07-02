return {
  "mason-org/mason-lspconfig.nvim",
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      "intelephense",
      "ts_ls",
    },
  },
  keys = {
    { '<leader>la', vim.lsp.buf.code_action },
    { '<leader>li', vim.lsp.buf.implementation },
    { '<leader>ln', vim.lsp.buf.rename },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
