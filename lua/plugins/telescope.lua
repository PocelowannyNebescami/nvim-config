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
            require('telescope.builtin').live_grep,
            desc = "Find string in the [p]roject",
        },
        {
            '<leader>rs',
            require('telescope.builtin').lsp_references,
            desc = "[R]eferences to [s]ymbol"
        },
        {
            '<F1>',
            require('telescope.builtin').help_tags,
            desc = "Search help tags",
        },
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
