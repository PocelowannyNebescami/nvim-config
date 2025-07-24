return {
    'saghen/blink.cmp',
    -- enabled = false,
    version = '1.*',
    dependencies = {
        'rafamadriz/friendly-snippets',
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    opts = {
        keymap = { preset = 'super-tab' },
        completion = { documentation = { auto_show = false } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
    opts_extend = { "sources.default" },
}
