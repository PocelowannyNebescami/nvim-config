local bfmt = require('plugins.lualine.format').git_branch

return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = false,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {},
            lualine_b = { { 'branch', fmt = bfmt } },
            lualine_c = {
                {
                    'filename',
                    path = 1, -- relative
                    symbols = { readonly = '[Read]' },
                },
            },
            lualine_x = { 'diagnostics' },
            lualine_y = { '%l:%c %P' }, -- {line}:{column} {percentage}
            lualine_z = {},
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    'filename',
                    path = 3, -- absolute with "~"
                    symbols = { readonly = '[Read]' },
                },
            },
            lualine_x = { 'progress' },
            lualine_y = {},
            lualine_z = {},
        },
    },
}
