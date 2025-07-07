local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        local view = vim.fn.winsaveview()

        vim.cmd [[%s:\s\+$::e]]
        vim.fn.winrestview(view)
    end
})

local gofumpt_exists = vim.fn.executable("gofumpt") == 1
local golines_exists = vim.fn.executable("golines") == 1
local formatter

if gofumpt_exists then
    formatter = "gofumpt"
elseif golines_exists then
    formatter = "golines"
else
    formatter = "go fmt"
end

local function format_go()
    vim.cmd("silent !" .. formatter .. " -w %")
    vim.cmd("checktime")
end

autocmd('BufWritePost', {
    pattern = "*.go",
    callback = format_go,
})

autocmd('BufEnter', {
    pattern = { '*.ts?', '*.js?' },
    callback = function()
        local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
        vim.fn.setreg('l', "yoconsole.log('" .. esc .. "pa:', " .. esc .. "p")
    end,
    desc = 'Add a macros to log a variable in js/ts',
})
