-- This check is here so that I don't have to deal with all the red squiggles
-- in documentation files, which tend to be read-only.
if not vim.opt_local.readonly then
  vim.opt_local.spell = true
end
