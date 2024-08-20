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
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = lsp.cmp_action()
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

lsp.set_sign_icons({
})

lsp.on_attach(function(_, bufnr)
    local opts = function(description)
        if description == nil  or description == nil then
            return { buffer = bufnr, remap = false }
        end
        return { buffer = bufnr, remap = false, desc = description }
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition,
            opts("[G]o to [d]efinition"))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
            opts("[G]o to [d]eclaration"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol,
            opts("[V]iew [w]orkspace [s]ymbol"))
    vim.keymap.set("n", "<leader>vc", vim.diagnostic.open_float,
            opts("[V]iew diagnosti[c] messages"))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next,
            opts("Go to next [d]iagnostic message"))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev,
            opts("Go to previous [d]iagnostic message"))
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,
            opts("[V]iew [c]ode [a]ctions"))
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references,
            opts("[V]iew [r]efe[r]ences"))
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename,
            opts("[R]e[n]ame symbol"))
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
            opts("Signature [h]elp"))
end)

lsp.setup()
