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
    use { 'nvim-treesitter/nvim-treesitter-context' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
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
