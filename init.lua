local options = require("config.options")
for option, value in pairs(options) do
    vim.opt[option] = value
end

vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
    pattern = "*",
})

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>oe", vim.cmd.Explore)
vim.keymap.set("n", "<leader>ox", vim.cmd.Sexplore)
vim.keymap.set("n", "<leader>ov", vim.cmd.Vexplore)

require("core.plugins")
