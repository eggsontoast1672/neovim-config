local M = {}

M.setup = function()
    require("eggs.options").setup()
    require("eggs.plugins").setup()
    require("eggs.colorscheme").setup("tokyonight", { is_plugin = true })
end

return M
