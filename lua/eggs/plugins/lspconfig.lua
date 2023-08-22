local servers = {
    clangd = {},
    hls = {},
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
    ocamllsp = {},
    rust_analyzer = {},
}

local on_attach = function(_, bufnr)
    local set_keymap = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end

    -- stylua: ignore start

    set_keymap("n", "<leader>la", vim.lsp.buf.code_action)
    set_keymap("n", "gD", vim.lsp.buf.declaration)
    set_keymap("n", "gd", vim.lsp.buf.definition)
    set_keymap("n", "<leader>lf", vim.lsp.buf.format)
    set_keymap("n", "K", vim.lsp.buf.hover)
    set_keymap("n", "gI", vim.lsp.buf.implementation)
    set_keymap("n", "gr", vim.lsp.buf.references)
    set_keymap("n", "<leader>lr", vim.lsp.buf.rename)
    set_keymap("n", "<c-k>", vim.lsp.buf.signature_help)
    set_keymap("n", "<leader>D", vim.lsp.buf.type_definition)

    -- stylua: ignore end

    set_keymap("n", "gl", function() -- From LunarVim source
        local float = vim.diagnostic.config().float
        if float then
            local config = type(float) == "table" and float or {}
            config.scope = "line"
            vim.diagnostic.open_float(config)
        end
    end)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("eggs.plugins.cmp").setup(capabilities)

require("neodev").setup()
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = servers,
})

for server, settings in pairs(servers) do
    if server == "clangd" then
        goto continue
    end
    require("lspconfig")[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = settings,
    })
    ::continue::
end
