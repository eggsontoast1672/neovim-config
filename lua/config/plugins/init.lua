local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.plugins.lspconfig")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.plugins.treesitter")
        end,
        run = function()
            pcall(vim.cmd.TSUpdate)
        end,
    },
    {
        "sainnhe/gruvbox-material",
        config = function()
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}

return plugins
