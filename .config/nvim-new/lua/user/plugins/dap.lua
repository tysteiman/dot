return {
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    event = "BufRead *.ts",
    dependencies = {"nvim-neotest/nvim-nio"},
    priority = 1,
    config = function()
      require("dapui").setup()
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
          request = "attach",
          name = "Attach to Running Node Process",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }

      vim.keymap.set("n", "<leader>bt", function()
        dap.toggle_breakpoint()
      end)

      vim.keymap.set("n", "<leader>bo", function()
        dap.step_over()
      end)

      vim.keymap.set("n", "<leader>bi", function()
        dap.step_into()
      end)

      vim.keymap.set("n", "<leader>bc", function()
        dap.continue()
      end)

      vim.keymap.set("n", "<leader>bq", function()
        dap.disconnect()
      end)
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
        adapters = { 'pwa-node', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
      })
    end,
  },
}
