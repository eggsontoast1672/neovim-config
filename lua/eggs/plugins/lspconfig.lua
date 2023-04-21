require("lspconfig.ui.windows").default_options.border = "rounded"

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

local function on_attach(_, bufnr)
    local opts = {
        buffer = bufnr,
    }

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, opts)
    vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
end

require("neodev").setup()
require("mason").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local mason_lspconfig = require("mason-lspconfig")
local servers = require("eggs.settings").lsp_servers

-- If this breaks stuff, comment it out. Added for jsonls
capabilities.textDocument.completion.completionItem.snippetSupport = true

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

local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<c-b>"] = cmp.mapping.scroll_docs(-4),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<c-f>"] = cmp.mapping.scroll_docs(4),
        ["<c-space>"] = cmp.mapping.complete(),
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
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
