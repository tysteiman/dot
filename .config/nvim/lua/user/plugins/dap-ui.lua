return {
  "rcarriga/nvim-dap-ui",
  lazy = true,
  event = {
    "BufEnter *.ts",
    "BufEnter *.php",
  },
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
}
