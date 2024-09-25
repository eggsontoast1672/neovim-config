return {
  "nvim-treesitter/nvim-treesitter",
  run = vim.cmd.TSUpdate,
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
    })
  end,
}
