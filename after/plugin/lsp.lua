require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed =  { 'lua_ls', 'marksman', },
    handlers = {
        -- default handler
        function (server_name)
            require("lspconfig")[server_name].setup {}
        end,
        ["lua_ls"] = function ()
            local runtime_path = vim.split(package.path, ';')
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")
            require('lspconfig').lua_ls.setup({
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
        end,
        ["gopls"] = function ()
            require('lspconfig').gopls.setup({
                filetypes = { 'go', 'gomod', 'gowork', 'gotmpl', 'templ' },
            })
        end,
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lsnip = require("luasnip")
cmp.setup({
    snippet = {
        expand = function(args)
            lsnip.lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, { name = 'buffer' }),
    mapping = cmp.mapping.preset.insert({
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
    }),
})

local lspconfig = require('lspconfig')
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

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
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float,
                opts("[L]SP [d]iagnostic"))
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
                opts("Next [d]iagnostic message"))
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
                opts("Previous [d]iagnostic message"))
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,
                opts("[L]SP code [a]ctions"))
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename,
                opts("[L]SP [r]ename symbol"))
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
