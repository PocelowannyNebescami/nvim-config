return {
    {
        'mason-org/mason-lspconfig.nvim',
        version = 'v1.*',
        dependencies = {
            { 'mason-org/mason.nvim',  version = 'v1.*', opts = {} },
            { 'neovim/nvim-lspconfig', version = 'v1.*' },
            { 'saghen/blink.cmp', version = '1.*' },
        },
        opts = {
            ensure_installed = { 'lua_ls', 'marksman' },
            handlers = {
                -- default handler
                function(server_name)
                    local capabilities =
                        require('blink.cmp').get_lsp_capabilities()

                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    local capabilities =
                        require('blink.cmp').get_lsp_capabilities()

                    local runtime_path = vim.split(package.path, ';')
                    table.insert(runtime_path, "lua/?.lua")
                    table.insert(runtime_path, "lua/?/init.lua")
                    require('lspconfig').lua_ls.setup({
                        capabilities = capabilities,
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
                                    library = {
                                        vim.env.VIMRUNTIME,
                                        "${3rd}/luv/library",
                                    },
                                },
                            },
                        },
                    })
                end,
                ["gopls"] = function()
                    local capabilities =
                        require('blink.cmp').get_lsp_capabilities()

                    require('lspconfig').gopls.setup({
                        capabilities = capabilities,
                        filetypes = {
                            'go',
                            'gomod',
                            'gowork',
                            'gotmpl',
                            'templ',
                        },
                    })
                end,
            },
        },
    },
}
