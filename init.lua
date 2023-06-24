--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
-- ~/.config/nvim/init.lua

require("eggs.plugins")

vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.opt.guicursor = "i:block"
vim.opt.guifont = "Fira Code:h14"
vim.opt.laststatus = 3
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.wrap = false

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Explore)
vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>")
vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>w", vim.cmd.write)

vim.api.nvim_create_autocmd("BufWritePre", {
    command = [[%s/\s\+$//e]],
    pattern = "*",
})

vim.cmd.colorscheme("gruvbox-material")
