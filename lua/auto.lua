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

autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = function(description)
            if description == nil or description == nil then
                return { buffer = event.buf, remap = false }
            end
            return { buffer = event.buf, remap = false, desc = description }
        end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition,
            opts("[G]o to [d]efinition"))
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
            opts("[G]o to [d]eclaration"))
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float,
            opts("[L]SP [d]iagnostic"))
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,
            opts("[L]SP code [a]ctions"))
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format,
            opts("[L]SP [f]ormat buffer"))
    end
})
