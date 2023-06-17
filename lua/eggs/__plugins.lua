local plugins = {
    { "L3MON4D3/LuaSnip" },
    { "andweeb/presence.nvim" },
    { "folke/neodev.nvim" },
    { "folke/tokyonight.nvim" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip" },
    { "sainnhe/gruvbox-material" },
    { "tribela/vim-transparent" },
    { "wbthomason/packer.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("eggs.plugins.lspconfig").setup()
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("eggs.plugins.telescope").setup()
        end,
        requires = {
            "nvim-lua/plenary.nvim",
        },
        tag = "0.1.1",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("eggs.plugins.treesitter").setup()
        end,
        run = function()
            pcall(vim.cmd.TSUpdate)
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
