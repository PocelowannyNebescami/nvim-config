require('neovim-project').setup({
    projects = {
        "~/Projects/*",
        "~/projects/*",
        "~/.config/*",
    },
})

vim.keymap.set('n', '<leader>ss', ':Telescope neovim-project history<CR>')
vim.keymap.set('n', '<leader>SS', ':Telescope neovim-project discover<CR>')
