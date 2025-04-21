require('neovim-project').setup({
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
})

vim.keymap.set('n', '<leader>ss', ':Telescope neovim-project history<CR>', {
    desc = "Select a project from recent history (remove with <C-d>)"
})
vim.keymap.set('n', '<leader>SS', ':Telescope neovim-project discover<CR>', {
    desc = "Discover a project"
})
