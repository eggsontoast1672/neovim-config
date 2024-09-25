--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|

if vim.g.vscode then
  return
end

require("config.autocmds")
require("config.keymaps")
require("config.options")

-- Set lazy up last because plugin configs are the most likely to fail. For
-- instance, if my plugis fail to load, I still want my options and
-- autocommands to be set correctly.
require("config.lazy")
