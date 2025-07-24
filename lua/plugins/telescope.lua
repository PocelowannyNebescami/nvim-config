local is_git_repo = function()
    local git_command = "git rev-parse --is-inside-work-tree"
    return vim.fn.systemlist(git_command)[1] == "true"
end

return {
    'nvim-telescope/telescope.nvim',
    version = 'v0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {
            '<C-p>',
            function()
                local builtin = require('telescope.builtin')
                if is_git_repo() then
                    builtin.git_files()
                else
                    builtin.find_files()
                end
            end,
            desc = "Find files in [p]roject"
        },
        {
            '<leader>ps',
            function()
                require('telescope.builtin').grep_string({
                    search = vim.fn.input("Grep > "),
                })
            end,
            desc = "Find files in [p]roject with [s]tring",
        },
        {
            '<leader>rs',
            require('telescope.builtin').lsp_references,
            desc = "[R]eferences to [s]ymbol"
        }
    },
    opts = {
        defaults = {
            layout_strategy = 'flex',
            mappings = {
                i = {
                    ["<esc>"] = require('telescope.actions').close
                },
            },
        },
    }
}
