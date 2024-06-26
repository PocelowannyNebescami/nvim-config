local lsp = require('lsp-zero')

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed =  {
        'lua_ls',
        'clangd',
        'gopls',
        'marksman',
    }
})

lsp.setup_servers({
    'gopls',
    'marksman',
})
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.clangd.setup({
    cmd = { "clangd", "--header-insertion=never" },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

lsp.set_sign_icons({
})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gD", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vc", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
