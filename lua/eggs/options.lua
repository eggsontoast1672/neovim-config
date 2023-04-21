local M = {}

M.setup = function()
    local defaults = require("eggs.settings").options
    for option, value in pairs(defaults) do
        vim.opt[option] = value
    end
end

return M
