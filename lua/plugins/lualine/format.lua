local M = {}

local BRANCH_SYMBOLS = {
    feat     = "f",
    fix      = "x",
    chore    = "c",
    refactor = "r",
}

-- Prettifies branch name for Lualine
-- @param branch (string)
-- @param context (table)
-- @return Formatted branch
function M.git_branch(branch, _)
    return branch:gsub("^(%w+)/", function(prefix)
        local symbol = BRANCH_SYMBOLS[prefix]
        if symbol then
            return symbol .. "/"
        end

        return prefix .. "/"
    end)
end

return M
