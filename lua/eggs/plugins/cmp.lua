local M = {}

---@param capabilities table
---@return table
M.setup = function(capabilities)
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

    return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

return M
