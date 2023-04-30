local M = {}

M.setup = function()
    -- Bootstrap call must be first, since it installs packer
    local bootstrap = require("eggs.bootstrap").ensure_packer()
    local packer = require("packer")

    packer.startup(function(use)
        use("L3MON4D3/LuaSnip")
        use("andweeb/presence.nvim")
        use("folke/neodev.nvim")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-cmdline")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-path")
        use("hrsh7th/nvim-cmp")
        use("lukas-reineke/lsp-format.nvim")
        use("saadparwaiz1/cmp_luasnip")
        use("sainnhe/gruvbox-material")
        use("wbthomason/packer.nvim")
        use("williamboman/mason-lspconfig.nvim")
        use({
            "catppuccin/nvim",
            as = "catppuccin",
        })
        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("eggs.plugins.lspconfig").setup()
            end,
        })
        use({
            "nvim-telescope/telescope.nvim",
            config = function()
                require("eggs.plugins.telescope")
            end,
            requires = {
                "nvim-lua/plenary.nvim",
            },
            tag = "0.1.1",
        })
        use({
            "nvim-treesitter/nvim-treesitter",
            config = require("eggs.plugins.treesitter").setup,
            run = function()
                pcall(vim.cmd.TSUpdate)
            end,
        })
        use({
            "tribela/vim-transparent",
            config = function()
                require("eggs.plugins.transparent").setup()
            end,
        })
        use({
            "williamboman/mason.nvim",
            run = function()
                pcall(vim.cmd.MasonUpdate)
            end,
        })

        if bootstrap then
            packer.sync()
        end
    end)
end

return M
