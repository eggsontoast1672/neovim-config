local M = {}

print("Hello! #1")

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

---@return table
local setup_cmp = function()
    local cmp = require("cmp")

    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ["<c-e>"] = cmp.mapping.abort(),
            ["<c-space>"] = cmp.mapping.complete(),
            ["<tab>"] = cmp.mapping.confirm({ select = true }),
            ["<c-f>"] = cmp.mapping.scroll_docs(4),
            ["<c-b>"] = cmp.mapping.scroll_docs(-4),
        }),
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
        }),
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    })
    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "cmp_git" },
        }, {
            { name = "buffer" },
        }),
    })
    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })

    return require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
end

---@param capabilities table
local setup_mason = function(capabilities)
    require("mason").setup()

    local mason_lspconfig = require("mason-lspconfig")
    local servers = require("eggs.settings").lsp_servers

    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
    })
    mason_lspconfig.setup_handlers({
        function(server)
            require("lspconfig")[server].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server],
            })
        end,
    })
end

M.setup = function()
    print("Hello!")

    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

    require("neodev").setup()

    local capabilities = setup_cmp()

    -- If this breaks stuff, comment it out. Added for jsonls
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    setup_mason(capabilities)
end

return M
