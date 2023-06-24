local packer = require("packer")

packer.startup(function(use)
    use("andweeb/presence.nvim")
    use("folke/neodev.nvim")
    use("folke/tokyonight.nvim")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("eggs.plugins.lspconfig")
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("eggs.plugins.treesitter")
        end,
        run = function()
            pcall(vim.cmd.TSUpdate)
        end,
    })
    use("saadparwaiz1/cmp_luasnip")
    use("sainnhe/gruvbox-material")
    use("wbthomason/packer.nvim")
    use({
        "williamboman/mason.nvim",
        run = function()
            pcall(vim.cmd.MasonUpdate)
        end,
    })
    use("williamboman/mason-lspconfig.nvim")
    require("eggs.plugins.telescope").setup(use)
    require("eggs.plugins.transparent").setup(use)

    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd([[
            packadd packer.nvim
        ]])
        packer.sync()
    end
end)
