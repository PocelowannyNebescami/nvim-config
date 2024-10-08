return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'coffebar/neovim-project',
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim", branch = '0.1.x' },
            { "Shatur/neovim-session-manager" },
        }
    }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use { 'williamboman/mason.nvim' }
    use {
        'neovim/nvim-lspconfig',
        requires = {
            { 'williamboman/mason-lspconfig.nvim' },
        } }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip', tag = "v2.*" },
        }
    }

    use "lewis6991/gitsigns.nvim"

    use "HoNamDuong/hybrid.nvim"

    use 'nvim-lualine/lualine.nvim'

    use { 'mcauley-penney/visual-whitespace.nvim', config = function()
        return true
    end }

    use { 'kylechui/nvim-surround', tag = "*" }

    use 'm4xshen/autoclose.nvim'

    use 'stevearc/oil.nvim'

end)
