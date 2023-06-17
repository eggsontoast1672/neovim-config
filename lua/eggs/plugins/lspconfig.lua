local M = {}

---@param _ any
---@param bufnr number|boolean
local on_attach = function(_, bufnr)
    local set_keymap = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end

    -- stylua: ignore start

    set_keymap("n", "<leader>la",   vim.lsp.buf.code_action)
    set_keymap("n", "gD",           vim.lsp.buf.declaration)
    set_keymap("n", "gd",           vim.lsp.buf.definition)
    set_keymap("n", "<leader>lf",   vim.lsp.buf.format)
    set_keymap("n", "K",            vim.lsp.buf.hover)
    set_keymap("n", "gI",           vim.lsp.buf.implementation)
    set_keymap("n", "gr",           vim.lsp.buf.references)
    set_keymap("n", "<leader>lr",   vim.lsp.buf.rename)
    set_keymap("n", "<c-k>",        vim.lsp.buf.signature_help)
    set_keymap("n", "<leader>D",    vim.lsp.buf.type_definition)

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

---@param capabilities table
local setup_servers = function(capabilities)
    require("neodev").setup()
    require("mason").setup()

    local servers = {}
    local mason_lspconfig = require("mason-lspconfig")

    -- Only install a server if it's enabled in settings
    for _, language in pairs(require("eggs.settings").languages) do
        if language.enabled then
            table.insert(servers, language.server)
        end
    end

    mason_lspconfig.setup({
        ensure_installed = servers,
    })

    -- mason_lspconfig.setup_handlers({
    --     function(server)
    --         require("lspconfig")[server].setup({
    --             capabilities = capabilities,
    --             on_attach = on_attach,
    --             settings = servers[server],
    --         })
    --     end,
    -- })

    for _, language in pairs(require("eggs.settings").languages) do
        if language.enabled then
            require("lspconfig")[language.server].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = language.settings,
            })
        end
    end
end

local setup_ui = function()
    local border = require("eggs.settings").window.border

    require("lspconfig.ui.windows").default_options.border = border

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border,
    })
end

M.setup = function()
    setup_ui()

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- For jsonls
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    if require("eggs.settings").completion.enabled then
        capabilities = require("eggs.plugins.cmp").setup(capabilities)
    end

    setup_servers(capabilities)
end

return M
