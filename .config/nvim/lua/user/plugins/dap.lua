return {
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
}
