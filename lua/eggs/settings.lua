local M = {}

M.formatters = {
    "clang-format",
}

M.globals = {
    mapleader = " "
}

M.lsp_servers = {
    clangd = {},
    gopls = {},
    jsonls = {},
    lua_ls = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = {
                    "${3rd}/love2d/library",
                },
            },
        },
    },
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
}

M.options = {
    clipboard = "unnamedplus",
    colorcolumn = "80",
    expandtab = true,
    guicursor = "i:block",
    guifont = "Fira Code:h14",
    laststatus = 3,
    mouse = "a",
    number = true,
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 4,
    signcolumn = "yes",
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
    tabstop = 4,
    wrap = false,
}

M.plugins = {
    "L3MON4D3/LuaSnip",
    "folke/neodev.nvim",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "lukas-reineke/lsp-format.nvim",
    "saadparwaiz1/cmp_luasnip",
    "williamboman/mason-lspconfig.nvim",

    ----------------

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("eggs.plugins.lspconfig").setup()
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
        "tribela/vim-transparent",
        config = function()
            require("eggs.plugins.transparent").setup()
        end,
    },
    {
        "williamboman/mason.nvim",
        run = function()
            pcall(vim.cmd.MasonUpdate)
        end,
    },
}

M.treesitter_languages = {
    "cmake",
    "cpp",
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "typescript",
    "vim",
}

return M
