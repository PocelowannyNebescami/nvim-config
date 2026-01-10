return {
    "shatur/neovim-session-manager",
    lazy = false,
    config = function()
        local config = require('session_manager.config')

        require('session_manager').setup {
            sessions_dir = vim.fn.stdpath('state') .. '/sessions/',
            autoload_mode = {
                config.AutoloadMode.GitSession,
                config.AutoloadMode.CurrentDir,
                config.AutoloadMode.Disabled,
            },
        }
    end,
}
