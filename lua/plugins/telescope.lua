return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files hidden=true<cr>" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        ".git",   -- Git repository files
        "_build", -- Dune build files (ocaml)
        "target", -- Cargo build files (rust)
      },
    },
  },
}
