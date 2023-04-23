local M = {}

M.setup = function()
    local settings = require("eggs.settings")

    require("nvim-treesitter.configs").setup({
        ensure_installed = settings.treesitter.languages,
        highlight = {
            enable = settings.treesitter.highlighting.enabled,
        },
    })
end

return M
