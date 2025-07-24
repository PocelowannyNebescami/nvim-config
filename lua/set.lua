vim.loader.enable()

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.spelllang = { "en_us", "ru" }
vim.opt.spellsuggest = { "best", 3 }
vim.opt.spell = true

vim.o.splitright = true

vim.diagnostic.config({
    virtual_text = {
        prefix = '🤓',
    }
})

local border_style = "rounded"
vim.diagnostic.config{ float = { border = border_style } }
