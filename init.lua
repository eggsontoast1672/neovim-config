vim.g.mapleader = " "

require("eggs.config").setup()

vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
    pattern = "*",
})

-- for global, value in pairs(require("eggs.settings").globals) do
--     vim.g[global] = value
-- end

require("eggs.keymaps")
