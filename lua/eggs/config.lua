local M = {}

M.setup = function()
    require("eggs.options").setup()
    require("eggs.plugins").setup()
end

return M
