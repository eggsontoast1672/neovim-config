require("nvim-treesitter.configs").setup({
  ensure_installed = { "cmake", "cpp", "lua", "vim" },
  highlight = {
    enable = true,
  },
})
