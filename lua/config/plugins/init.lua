local plugins = {
    {
        "folke/neodev.nvim",
    },
    {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.plugins.lspconfig")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("config.plugins.telescope")
        end,
        requires = {
            "nvim-lua/plenary.nvim",
        },
        tag = "0.1.1",
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
    {
        "williamboman/mason.nvim",
        run = function()
            pcall(vim.cmd.MasonUpdate)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
}

return plugins
