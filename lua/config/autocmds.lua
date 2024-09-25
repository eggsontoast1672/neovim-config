-- Handy dandy function for creating augroups. The reason we want this is
-- because without it, if the config is reloaded, autocmds will be duplicated
-- (that is bad).
local function create_augroup(name)
  return vim.api.nvim_create_augroup(name, {
    clear = true,
  })
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = create_augroup("trim_whitespace"),
  callback = function()
    -- Looks cryptic, but just trims trailing whitespace on save by
    -- replacing any amount of whitespace at the end of a line with
    -- nothing. The 'e' at the end prevents it from erroring when it didn't
    -- match anything.
    vim.cmd([[:%s/\s\+$//e]])
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = create_augroup("highlight_on_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
