require("nvim-treesitter.configs").setup({
    ensure_installed = { "cmake", "cpp", "css", "html", "lua", "markdown", "vim" },
    highlight = {
        enable = true,
    },
})
