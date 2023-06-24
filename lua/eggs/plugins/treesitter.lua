require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "rust",
        "vim",
    },
    highlight = {
        enable = true,
    },
})
