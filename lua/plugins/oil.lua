return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
        columns = {
            "icon",
            -- "permissions",
            -- "size",
            -- "mtime",
        },
        -- Window-local options to use for oil buffers
        win_options = {
            signcolumn = "yes",
        },
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR
        -- a table of keymap options with a `callback`
        -- (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>", it will use
        -- the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = {
                "actions.select",
                opts = { vertical = true },
                desc = "Open the entry in a vertical split",
            },
            ["<C-h>"] = {
                "actions.select",
                opts = { horizontal = true },
                desc = "Open the entry in a horizontal split",
            },
            ["<C-t>"] = {
                "actions.select",
                opts = { tab = true },
                desc = "Open the entry in new tab",
            },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = {
                "actions.cd",
                opts = { scope = "tab" },
                desc = ":tcd to the current oil directory",
            },
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
        },
    },
    keys = {
        {
            "<leader>pe",
            "<CMD>Oil<CR>",
            desc = "Open [p]roject [e]xplorer",
        },
    },
}
