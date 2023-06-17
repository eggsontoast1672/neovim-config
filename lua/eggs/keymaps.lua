vim.keymap.set("n", "<leader>e", vim.cmd.Explore)
vim.keymap.set("n", "<leader>w", vim.cmd.write)

-- Diagnostics

vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>")
vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev)
