-- Whenever a language server attaches to a buffer, these keymaps will be
-- enabled for that buffer.
local keymaps = {
  { lhs = "<leader>a", rhs = vim.lsp.buf.code_action },
  { lhs = "gd",        rhs = vim.lsp.buf.definition },
  { lhs = "K",         rhs = vim.lsp.buf.hover },
  { lhs = "<leader>r", rhs = vim.lsp.buf.rename },
  { lhs = "]d",        rhs = vim.diagnostic.goto_next },
  { lhs = "[d",        rhs = vim.diagnostic.goto_prev },
}

-- Here's an interesting idea I had. If the servers.lua file does not exist,
-- don't set up any servers. This makes it easier when downloading the config
-- fresh.
local ok, servers = pcall(require, "config.lsp.servers")
if ok then
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  for _, server in pairs(servers) do
    -- Make sure to pass the empty table or there will be an error! For some
    -- reason, lspconfig.server.setup does not replace the argument with an
    -- empty table if it is nil.
    lspconfig[server].setup({
      capabilities = capabilities,
    })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    for _, keymap in pairs(keymaps) do
      vim.keymap.set("n", keymap.lhs, keymap.rhs, { buffer = args.buf })
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({
          filter = function(client)
            -- We only want to format the buffer if the server either supports
            -- formatting or is set up through null-ls. That way, if neither
            -- are the case, no error is thrown.
            return client.server_capabilities.documentFormattingProvider or client.name == "null-ls"
          end,
        })
      end,
    })

    -- Disabling semantic tokens here. For the moment, I don't like them.
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<tab>"] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
  },
})
