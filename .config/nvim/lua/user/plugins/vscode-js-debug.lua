return {
  {
    "microsoft/vscode-js-debug",
    event = {
      "BufEnter *.ts",
      "BufEnter *.js",
    },
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out && git checkout package-lock.json",
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    event = {
      "BufEnter *.ts",
      "BufEnter *.js",
    },
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = os.getenv('HOME') .. "/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
        adapters = { 'node', 'pwa-node', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
      })
    end,
  },
}
