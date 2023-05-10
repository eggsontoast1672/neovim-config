local M = {
    completion = {
        enabled = true,
    },
    editor = {
        tab_size = 4,
    },
    languages = {
        c = {
            enabled = true,
            parser = { "c", "cpp" },
            server = "clangd",
            settings = {},
        },
        java = {
            enabled = true,
            parser = "java",
            server = "jdtls",
            settings = {},
        },
        json = {
            enabled = true,
            parser = "json",
            server = "jsonls",
            settings = {},
        },
        lua = {
            enabled = true,
            parser = "lua",
            server = "lua_ls",
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            "${3rd}/love2d/library",
                        },
                    },
                },
            },
        },
        python = {
            enabled = true,
            parser = "python",
            server = "pyright",
            settings = {},
        },
        rust = {
            enabled = true,
            parser = "rust",
            server = "rust_analyzer",
            settings = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
        javascript = {
            enabled = true,
            parser = { "javascript", "typescript" },
            server = "tsserver",
            settings = {},
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
    mapleader = " ",
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
