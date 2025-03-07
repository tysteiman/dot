return {
  'mfussenegger/nvim-dap',
  -- commit = '7ff6936010b7222fea2caea0f67ed77f1b7c60dd',
  lazy = true,
  event = {
    "BufEnter *.ts",
    "BufEnter *.js",
    "BufEnter *.tsx",
    "BufEnter *.jsx",
    "BufEnter *.php",
  },
  priority = 2,
  config = function()
    local dap = require('dap')

    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'PHP: Attach to XDebug',
        port = 9003,
        pathMappings = {
          ['/app/public_html'] = '${workspaceFolder}', -- Adjust as necessary
        },
      },
    }

    dap.configurations["typescript"] = {
      -- {
      --   type = "pwa-node",
      --   request = "launch",
      --   name = "Launch Nest App",
      --   runtimeExecutable = "npm",
      --   runtimeArgs = {
      --     "run",
      --     "start:debug",
      --   },
      --   rootPath = "${workspaceFolder}",
      --   cwd = "${workspaceFolder}",
      --   console = "integratedTerminal",
      --   internalConsoleOptions = "neverOpen",
      -- },
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
        -- program = "${workspaceFolder}/node_modules/@nestjs/cli/bin/nest.js",
        localRoot = "${workspaceFolder}",
        remoteRoot = "${workspaceFolder}",
      },
    }

    dap.configurations["javascript"] = {
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to UA (Port 9230)",
        port = 9230,
        program = "${workspaceFolder}/src/index.js",
        address = "localhost",
        localRoot = "${workspaceFolder}",
        remoteRoot = "/opt/madmobile/domain/ua-menu-admin/standalone",
        skipFiles = {"<node_internals>/**"},
      },
    }

    local wk = require('which-key')
    wk.register({
      d = {
        name = 'Debug',
        t = { dap.toggle_breakpoint, 'Toggle Breakpoint', },
        o = { dap.step_over, 'Step Over', },
        u = { dap.step_over, 'Step Out', },
        i = { dap.step_into, 'Step Into', },
        c = { dap.continue, 'Continue', },
        q = { dap.disconnect, 'Disconnect', },
      },
    }, { prefix = '<leader>' })
  end,
}
