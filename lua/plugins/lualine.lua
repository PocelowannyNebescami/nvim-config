return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = false,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = {
                {
                    'filename',
                    path = 1,
                    symbols = {
                        -- modified = '[+]',
                        readonly = '[Read]',
                    },
                },
            },
            lualine_x = { 'diagnostics' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
    },
}
