vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.completeopt = "menu"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = "i:block"
vim.opt.hlsearch = false
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wrap = false

-- This is some zig ftplugin bs. I have no idea why this is set by default but
-- it is so annoying.
vim.g.zig_fmt_autosave = 0
