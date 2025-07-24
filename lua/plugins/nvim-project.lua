return {
    'coffebar/neovim-project',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "Shatur/neovim-session-manager",
        { "nvim-telescope/telescope.nvim", version = 'v0.1.x' },
    },
    lazy = false,
    opts = {
        projects = {
            "~/Projects/*",
            "~/Documents/*",
            "~/.config/*",
        },
        picker = {
            type = "telescope",
            preview = {
                enabled = true,
                git_status = true,
                git_fetch = false,
                show_hidden = true,
            },
        },
    },
    keys = {
        {
            '<leader>ss',
            ':Telescope neovim-project history<CR>',
            desc = "Select a project from recent history (remove with <C-d>)",
        },
        {
            '<leader>SS',
            ':Telescope neovim-project discover<CR>',
            desc = "Discover a project",
        },

    },
}
