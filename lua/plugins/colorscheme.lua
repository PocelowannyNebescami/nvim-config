local function replace(dict, from, to)
    if type(dict) ~= "table" then
        return dict
    end

    for k, v in pairs(dict) do
        if type(v) == "table" then
            dict[k] = replace(v, from, to)
        elseif v == from then
            dict[k] = to
        end
    end

    return dict
end

return {
    "HoNamDuong/hybrid.nvim",
    opts = {
    },
    config = function()
        require('hybrid').setup({
            overrides = function(hl, c)
                hl.ColorColumn = { bg = "#212327" }

                hl = replace(hl, c.bg, c.bg_hard)
            end,
        })

        vim.cmd.colorscheme('hybrid')
    end,
}
