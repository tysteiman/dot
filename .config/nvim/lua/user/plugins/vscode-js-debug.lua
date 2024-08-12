return {
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    event = "BufEnter *.ts",
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out && git checkout package-lock.json",
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    lazy = true,
    event = "BufEnter *.ts",
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = "/Users/tyler.steiman/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
        adapters = { 'node', 'pwa-node', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
      })
    end,
  },
}
