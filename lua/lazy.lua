-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'coffebar/neovim-project',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "Shatur/neovim-session-manager",
            { "nvim-telescope/telescope.nvim", branch = '0.1.x' },
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        build = ':TSUpdate',
    },

    {
        'mason-org/mason.nvim',
        branch = 'v1.x',
        dependencies = {
            { 'mason-org/mason-lspconfig.nvim', branch = 'v1.x' },
            { 'neovim/nvim-lspconfig',          version = 'v1.*' },
        }
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            { 'L3MON4D3/LuaSnip', version = "v2.*" },
        },
    },

    "lewis6991/gitsigns.nvim",

    "HoNamDuong/hybrid.nvim",

    'nvim-lualine/lualine.nvim',

    {
        'kylechui/nvim-surround',
        version = "*",
    },

    'm4xshen/autoclose.nvim',

    'stevearc/oil.nvim',

    {
        "psliwka/vim-dirtytalk",
        build = ":DirtytalkUpdate",
    },

    { "shortcuts/no-neck-pain.nvim", version = "v2.*" },

    { 'folke/twilight.nvim' },

}
