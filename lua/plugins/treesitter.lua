return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "json",
                "lua",
                "vim",
                "gitcommit",
                "git_rebase",
                "diff",
            },
            ignore_install = { "javascript" },
            auto_install = true,

            highlight = {
                enable = true,
            },
        }
    end,
}
