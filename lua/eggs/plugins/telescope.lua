local M = {}

local config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>f", builtin.find_files)

    -- vim.keymap.set("n", "<leader>fb", builtin.buffers)
    -- vim.keymap.set("n", "<leader>fc", builtin.colorscheme)
    -- vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    -- vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    -- vim.keymap.set("n", "<leader>fm", builtin.man_pages)
end

M.setup = function(use)
    use({
        "nvim-telescope/telescope.nvim",
        config = config,
        requires = {
            "nvim-lua/plenary.nvim",
        },
        tag = "0.1.1",
    })
end

return M
