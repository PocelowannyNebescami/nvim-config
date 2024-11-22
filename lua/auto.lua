local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        local view = vim.fn.winsaveview()

        vim.cmd [[%s:\s\+$::e]]
        vim.fn.winrestview(view)
    end
})
