require('neovim-project').setup({
    projects = {
        "~/Projects/*",
        "~/projects/*",
        "~/.config/*",
    },
})

vim.keymap.set('n', '<leader>ss', ':Telescope neovim-project history<CR>', {
    desc = "Discover a project"
})
-- to remove a project from history use <C-d>
vim.keymap.set('n', '<leader>SS', ':Telescope neovim-project discover<CR>', {
    desc = "Select a project from recent history"
})
