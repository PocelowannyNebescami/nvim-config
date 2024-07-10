local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {
    desc = "Find [p]roject [f]iles"
})
vim.keymap.set('n', '<C-p>', function()
    builtin.git_files({ cwd = utils.buffer_dir() })
end, { desc = "Find files in [p]roject respecting git"})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Find files in [p]roject with [s]tring" })
vim.keymap.set('n', '<leader>rs', builtin.lsp_references, {
	desc = "[R]eferences to [s]ymbol"
})
