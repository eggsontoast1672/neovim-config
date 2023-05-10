local M = {}

---@param _ any
---@param bufnr number|boolean
local on_attach = function(_, bufnr)
    local keymap_set = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end

    keymap_set("n", "<leader>ca", vim.lsp.buf.code_action)
    keymap_set("n", "gD", vim.lsp.buf.declaration)
    keymap_set("n", "gd", vim.lsp.buf.definition)
    keymap_set("n", "K", vim.lsp.buf.hover)
    keymap_set("n", "gI", vim.lsp.buf.implementation)
    keymap_set("n", "<leader>rn", vim.lsp.buf.rename)
    keymap_set("n", "<c-k>", vim.lsp.buf.signature_help)
    keymap_set("n", "<leader>D", vim.lsp.buf.type_definition)

    local builtin = require("telescope.builtin")

    keymap_set("n", "<leader>ds", builtin.lsp_document_symbols)
    keymap_set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols)
    keymap_set("n", "gr", builtin.lsp_references)
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

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- For jsonls
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    if require("eggs.settings").completion.enabled then
        capabilities = require("eggs.plugins.cmp").setup(capabilities)
    end

    setup_servers(capabilities)
end

return M
