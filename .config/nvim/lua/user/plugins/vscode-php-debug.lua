return {
  'xdebug/vscode-php-debug',
  lazy = true,
  event = "BufEnter *.php",
  priority = 2,
  config = function()
    local dap = require('dap')
    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = {os.getenv('HOME') .. '/.local/share/nvim/lazy/vscode-php-debug/out/phpDebug.js'}
    }
  end,
}
