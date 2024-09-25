local M = {}

M.set_tab_width = function(options)
  vim.opt_local.shiftwidth = options.spaces
  vim.opt_local.softtabstop = options.spaces
  vim.opt_local.tabstop = options.spaces

  -- We want spaces to be the default, but allow tab indentation to be set here
  if options.use_tab then
    vim.opt_local.expandtab = false
  end
end

return M
