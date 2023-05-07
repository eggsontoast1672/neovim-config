local M = {}

M.setup = function()
    -- Bootstrap call must be first, since it installs packer
    local bootstrap = require("eggs.bootstrap").ensure_packer()
    local packer = require("packer")

    packer.startup(function(use)
        use("L3MON4D3/LuaSnip")
        use("andweeb/presence.nvim")
        use("folke/neodev.nvim")
        use("folke/tokyonight.nvim")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-cmdline")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-path")
        use("hrsh7th/nvim-cmp")
        use("saadparwaiz1/cmp_luasnip")
        use("wbthomason/packer.nvim")
        use("williamboman/mason-lspconfig.nvim")
        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("eggs.plugins.lspconfig").setup()
            end,
        })
        require("eggs.plugins.telescope").setup(use)
        require("eggs.plugins.treesitter").setup(use)
        require("eggs.plugins.transparent").setup(use)
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
