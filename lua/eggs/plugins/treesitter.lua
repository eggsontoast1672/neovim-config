local M = {}

local config = function()
    local settings = require("eggs.settings.treesitter")

    require("nvim-treesitter.configs").setup({
        ensure_installed = settings.languages,
        highlight = {
            enable = settings.highlighting.enabled,
        },
    })
end

M.setup = function(use)
    use({
        "nvim-treesitter/nvim-treesitter",
        config = config,
        run = function()
            pcall(vim.cmd.TSUpdate)
        end,
    })
end

return M
