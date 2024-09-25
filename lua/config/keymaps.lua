-- For my reference: You can view active mappings by using :map.

-- These need to be set before lazy is set up so that plugin keymaps are loaded
-- correctly.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")
vim.keymap.set("n", "<leader>he", "<cmd>%!xxd<cr>")
vim.keymap.set("n", "<leader>hr", "<cmd>%!xxd -r<cr>")
