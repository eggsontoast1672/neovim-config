require("nvim-treesitter.configs").setup({
    ensure_installed = { "cmake", "cpp", "lua", "markdown" },
    highlight = {
        enable = true,
    },
})
