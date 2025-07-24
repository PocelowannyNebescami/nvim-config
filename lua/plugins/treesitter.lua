return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    opts = {
        -- A list of parser names, or "all"
        -- (the five listed parsers should always be installed)
        ensure_installed = { "json", "lua", "vim" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
            enable = true,
        },
    },
}
