local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        local view = vim.fn.winsaveview()

        vim.cmd [[%s:\s\+$::e]]
        vim.fn.winrestview(view)
    end
})

autocmd("BufEnter", {
    desc = "Disable autocommenting",

    callback = function ()
        vim.opt_local.formatoptions:remove({
            'c', -- auto-wrap comments
            'r', -- comment leader on <Enter>
            'o', -- comment leader after `o` and `O`
        })
    end
})
