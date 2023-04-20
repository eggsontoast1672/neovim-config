local plugins = {
    "L3MON4D3/LuaSnip",
    "folke/neodev.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "saadparwaiz1/cmp_luasnip",
    "tribela/vim-transparent",
    "williamboman/mason-lspconfig.nvim",

    ----------------

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("eggs.plugins.lspconfig")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("eggs.plugins.telescope")
        end,
        requires = {
            "nvim-lua/plenary.nvim",
        },
        tag = "0.1.1",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("eggs.plugins.treesitter")
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
}

return plugins
