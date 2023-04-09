local options = require("config.options")
for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.api.nvim_create_autocmd("BufWritePre", {
  command = [[%s/\s\+$//e]],
  pattern = "*",
})
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
  pattern = "lua",
})

require("core.plugins")

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Explore)
vim.keymap.set("n", "<leader>s", vim.cmd.Sexplore)
vim.keymap.set("n", "<leader>v", vim.cmd.Vexplore)
