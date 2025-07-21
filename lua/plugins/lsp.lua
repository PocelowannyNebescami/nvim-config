return {
    {
        'mason-org/mason-lspconfig.nvim',
        version = 'v1.*',
        dependencies = {
            { 'mason-org/mason.nvim', version = 'v1.*', opts = {} },
            { 'neovim/nvim-lspconfig', version = 'v1.*' },
        },
        opts = {
            ensure_installed = { 'lua_ls', 'marksman' },
            handlers = {
                -- default handler
                function(server_name)
                    require("lspconfig")[server_name].setup()
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
                                    library = {
                                        vim.env.VIMRUNTIME,
                                        "${3rd}/luv/library",
                                    },
                                },
                            },
                        },
                    })
                end,
                ["gopls"] = function ()
                    require('lspconfig').gopls.setup({
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
