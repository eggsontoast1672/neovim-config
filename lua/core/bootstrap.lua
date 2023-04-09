local M = {}

function M.ensure_packer()
  local install_path = vim.fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) then
    vim.fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    return true
  end
  return false
end

return M
