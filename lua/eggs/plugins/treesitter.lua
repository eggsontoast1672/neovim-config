require("nvim-treesitter.configs").setup({
    ensure_installed = require("eggs.settings").treesitter_languages,
    highlight = {
        enable = true,
    },
})
