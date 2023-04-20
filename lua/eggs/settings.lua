local M = {}

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
