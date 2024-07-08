vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pe", vim.cmd.Ex, { desc = "[P]roject [e]xplorer" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", {
    desc = "S[c]roll half a screen [d]own and center"
})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    desc = "S[c]roll half a screen [u]p and center"
})
vim.keymap.set("n", "n", "nzzzv", { desc = "Center at [n]ext search result" })
vim.keymap.set("n", "N", "Nzzzv", {
    desc = "Center at previous search result"
})

vim.keymap.set("n", "<leader>y", "\"+y", {
    desc = "[Y]ank to system clipboard"
})
vim.keymap.set("v", "<leader>y", "\"+y", {
    desc = "[Y]ank to system clipboard"
})
vim.keymap.set("n", "<leader>Y", "\"+Y", {
    desc = "[Y]ank to system clipboard"
})

vim.keymap.set("i", "<C-c>", "<Esc>")
