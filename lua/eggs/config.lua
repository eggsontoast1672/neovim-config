local M = {}

M.setup = function()
    require("eggs.options").setup()
    require("eggs.plugins").setup()
    require("eggs.colorscheme").setup("gruvbox-material", { is_plugin = true })
end

return M
