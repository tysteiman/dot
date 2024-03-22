-- Insert Mode Bindings
lvim.keys.insert_mode["jk"] = "<esc>"

-- Configure Built-in Plugins
lvim.builtin.indentlines.active = false
lvim.builtin.breadcrumbs.active = false
lvim.builtin.nvimtree.setup.view.width = 60
lvim.builtin.telescope.theme = "ivy"
lvim.builtin.dap.ui.config.expand_lines = false -- turn off expanding objects on hover in dap ui, makes it hard to read
-- lvim.builtin.lualine.style = "default"

-- Vim Options
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.cursorline = false

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    args = { "--parser=typescript", "--config=.prettierrc" },
    filetypes = { "typescript", "typescriptreact" },
  },
}

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.ts" }

lvim.plugins = {
  { "mxsdev/nvim-dap-vscode-js" },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out && git checkout package-lock.json",
  },
}

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = "/Users/tyler.steiman/.local/share/lunarvim/site/pack/lazy/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})


require("dap").configurations["typescript"] = {
  -- {
  --   type = "pwa-node",
  --   request = "launch",
  --   name = "Launch file",
  --   program = "${file}",
  --   cwd = "${workspaceFolder}",
  -- },
  {
    -- -----------------------------------------------------------------
    -- Launch integrated debug server and attach to it with the debugger
    -- -----------------------------------------------------------------
    type = "pwa-node",
    request = "launch",
    name = "Launch Nest App",
    -- trace = true, -- include debugger info
    runtimeExecutable = "npm",
    runtimeArgs = {
      "run",
      "start:debug",
    },
    rootPath = "${workspaceFolder}",
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    internalConsoleOptions = "neverOpen",
  },
  {
    -- -----------------------------------------------------------------
    -- Attach to an already running node process
    -- -----------------------------------------------------------------
    type = "pwa-node",
    request = "attach",
    name = "Attach to Running Node Process",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
  -- {
  --   type = "pwa-node",
  --   request = "launch",
  --   name = "Debug Jest Tests",
  --   -- trace = true, -- include debugger info
  --   runtimeExecutable = "node",
  --   runtimeArgs = {
  --     "./node_modules/jest/bin/jest.js",
  --     "--runInBand",
  --   },
  --   rootPath = "${workspaceFolder}",
  --   cwd = "${workspaceFolder}",
  --   console = "integratedTerminal",
  --   internalConsoleOptions = "neverOpen",
  -- },
}

-- local dap = require('dap')
-- dap.configurations.typescript = {
--   {
--     type = 'pwa-node';
--     request = 'attach';
--     name = 'Attach Node Debugger';
--   }
-- }
