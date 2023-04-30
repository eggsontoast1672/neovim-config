local M = {}

M.setup = function()
    local settings = require("eggs.settings.treesitter")

    require("nvim-treesitter.configs").setup({
        ensure_installed = settings.languages,
        highlight = {
            enable = settings.highlighting.enabled,
        },
    })
end

return M
