require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed =  { 'lua_ls', 'marksman', }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lsnip = require("luasnip")
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        -- jump to the next param in a snippet
        ['<C-f>'] = cmp.mapping(function(fallback)
            if lsnip.locally_jumpable(1) then
                lsnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        -- jump to the previous param in a snippet
        ['<C-b>'] = cmp.mapping(function(fallback)
            if lsnip.locally_jumpable(-1) then
                lsnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
})

local lspconfig = require('lspconfig')

lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            telemetry = { enable = false },
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostic = { globals = { "vim" } },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME, "${3rd}/luv/library" }
            },
        }
    }
})

-- Markdown
lspconfig.marksman.setup({})

-- C++
lspconfig.clangd.setup({})
lspconfig.neocmake.setup({})

-- Golang
lspconfig.gopls.setup({
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl', 'templ' },
})
lspconfig.templ.setup({})
lspconfig.htmx.setup({})

-- Rust
lspconfig.rust_analyzer.setup({})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = function(description)
            if description == nil  or description == nil then
                return { buffer = event.buf, remap = false }
            end
            return { buffer = event.buf, remap = false, desc = description }
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
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
                opts("Go to next [d]iagnostic message"))
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
                opts("Go to previous [d]iagnostic message"))
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,
                opts("[V]iew [c]ode [a]ctions"))
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references,
                opts("[V]iew [r]efe[r]ences"))
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename,
                opts("[R]e[n]ame symbol"))
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
                opts("Signature [h]elp"))

    end
})

local border_style = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = border_style }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = border_style }
)
vim.diagnostic.config{ float = { border = border_style } }
