return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = { '/Users/tyler.steiman/proj/misc/vscode-php-debug/out/phpDebug.js' },
            }

            dap.configurations.php = {
                type = 'php',
                type = 'launch',
                name = 'Listen for Xdebug',
                port = 9000,
            }
        end
    }
}
