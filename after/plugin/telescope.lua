local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local is_git_repo = function()
    local git_command = "git rev-parse --is-inside-work-tree"
    return vim.fn.systemlist(git_command)[1] == "true"
end

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
    },
})

vim.keymap.set('n', '<C-p>', function()
    if is_git_repo() then
        builtin.git_files()
    else
        builtin.find_files()
    end
end, { desc = "Find files in [p]roject"})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Find files in [p]roject with [s]tring" })
vim.keymap.set('n', '<leader>rs', builtin.lsp_references, {
	desc = "[R]eferences to [s]ymbol"
})
