local M = {
    completion = {
        enabled = true,
    },
    editor = {
        tab_size = 4,
    },
    lsp = {
        enabled = true,
        servers = {
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
        },
    },
    treesitter = {
        highlighting = {
            enabled = true,
        },
        languages = {
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
        },
    },
    window = {
        border = "rounded",
    },
}

M.formatters = {
    "clang-format",
}

M.globals = {
    mapleader = " "
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
    shiftwidth = M.editor.tab_size,
    signcolumn = "yes",
    softtabstop = M.editor.tab_size,
    splitbelow = true,
    splitright = true,
    tabstop = M.editor.tab_size,
    wrap = false,
}

return M
