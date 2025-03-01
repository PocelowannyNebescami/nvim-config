require('neovim-project').setup({
    projects = {
        "~/Projects/*",
        "~/Documents/*",
        "~/.config/*",
    },
})

vim.keymap.set('n', '<leader>ss', ':Telescope neovim-project history<CR>', {
    desc = "Select a project from recent history (remove with <C-d>)"
})
vim.keymap.set('n', '<leader>SS', ':Telescope neovim-project discover<CR>', {
    desc = "Discover a project"
})
