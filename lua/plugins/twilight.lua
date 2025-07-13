return {
    'folke/twilight.nvim',
    opts = {
        dimming = {
            alpha = 0.25,
            color = { "Normal", "#ffffff" },
            term_bg = "#000000",
            inactive = true,
        },
        context = 15,
        expand = {
            "function",
            "method",
            "table",
            "if_statement",
        },
    },
    keys = {
        {
            '<leader>tw',
            '<CMD>Twilight<CR>',
            desc = 'Toggle [Tw]ilight',
        },
    },
}
