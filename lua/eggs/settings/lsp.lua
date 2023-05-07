return {
    enabled = true,
    servers = {
        clangd = {},
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
        rust_analyzer = {
            checkOnSave = {
                command = "clippy",
            },
        },
        tsserver = {},
    },
    use_telescope = true,
}
