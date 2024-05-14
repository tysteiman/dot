return {
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    event = "BufRead *.ts",
    dependencies = {"nvim-neotest/nvim-nio"},
    priority = 1,
    config = function()
      require("dapui").setup({
        expand_lines = false,
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.17 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "right",
          },
          {
            elements = {
              { id = "repl", size = 0.45 },
              { id = "console", size = 0.55 },
            },
            size = 0.27,
            position = "bottom",
          },
        },
      })

      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      local wk = require('which-key')
      wk.register({
        d = {
          name = 'Debug',
          n = { dapui.toggle, 'Open DAP UI', },
        },
      }, { prefix = '<leader>' })
    end,
  },
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    event = "BufRead *.ts",
    priority = 2,
    config = function()
      local dap = require('dap')

      dap.configurations["typescript"] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Nest App",
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
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest",
          runtimeExecutable = "npm",
          runtimeArgs = {
            "run",
            "test",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest (Current File)",
          runtimeExecutable = "npm",
          runtimeArgs = {
            "run",
            "test",
            vim.api.nvim_buf_get_name(0),
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to NestJS Application",
          -- processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
          port = 9229,
          program = "${workspaceFolder}/node_modules/@nestjs/cli/bin/nest.js",
          localRoot = "${workspaceFolder}",
          remoteRoot = "${workspaceFolder}",
        },
      }

      local wk = require('which-key')

      wk.register({
        d = {
          name = 'Debug',
          t = { dap.toggle_breakpoint, 'Toggle Breakpoint', },
          o = { dap.step_over, 'Step Over', },
          i = { dap.step_into, 'Step Into', },
          c = { dap.continue, 'Continue', },
          q = { dap.disconnect, 'Disconnect', },
        },
      }, { prefix = '<leader>' })
    end,
  },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    event = "BufRead *.ts",
    build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out && git checkout package-lock.json",
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    lazy = true,
    event = "BufRead *.ts",
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = "/Users/tyler.steiman/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
        adapters = { 'node', 'pwa-node', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
      })
    end,
  },
}

-- local dap = require('dap')
-- 
-- dap.adapters.php = {
--   type = 'executable',
--   command = 'node',
--   args = { '/path/to/vscode-php-debug/out/phpDebug.js' }
-- }
-- 
-- dap.configurations.php = {
--   {
--     type = 'php',
--     request = 'launch',
--     name = 'Listen for Xdebug',
--     port = 9000,
--     stopOnEntry = true,
--   },
-- }
-- 
-- dap.configurations.php = dap.configurations.php or {}
-- table.insert(dap.configurations.php, {
--   type = 'php',
--   request = 'launch',
--   name = 'Launch currently open script',
--   program = '${file}',
--   cwd = vim.fn.getcwd(),
--   port = 9000,
-- })

-- VSCODE PHP INSTALL: https://github.com/xdebug/vscode-php-debug
