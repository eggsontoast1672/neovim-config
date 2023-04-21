require("eggs.config").setup()

vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
    pattern = "*",
})

for global, value in pairs(require("eggs.settings").globals) do
    vim.g[global] = value
end

vim.keymap.set("n", "<leader>oe", vim.cmd.Explore)
vim.keymap.set("n", "<leader>ox", vim.cmd.Sexplore)
vim.keymap.set("n", "<leader>ov", vim.cmd.Vexplore)
