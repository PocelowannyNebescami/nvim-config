local ensure_packer = function()
    local fn = vim.fn
    local packer_path = 'packer/start/packer.nvim'

    local install_path = fn.stdpath('data')..'/site/pack/'..packer_path
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()
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

    use {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        run = ':TSUpdate',
    }

    use {
        'mason-org/mason.nvim',
        branch = 'v1.x',
        requires = {
            { 'mason-org/mason-lspconfig.nvim', branch = 'v1.x' },
            { 'neovim/nvim-lspconfig', tag = 'v1.*' },
        }
    }

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

    use { 'kylechui/nvim-surround', tag = "*" }

    use 'm4xshen/autoclose.nvim'

    use 'stevearc/oil.nvim'

    use {
        "psliwka/vim-dirtytalk",
        run = ":DirtytalkUpdate",
    }

    use { "shortcuts/no-neck-pain.nvim", tag = "v2.*" }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
