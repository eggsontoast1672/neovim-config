local bootstrap = require("core.bootstrap").ensure_packer()
local packer = require("packer")

local function setup_plugins(use)
    use("wbthomason/packer.nvim")
    -- local plugins = require("eggs.plugins")
    -- for _, plugin in pairs(plugins) do
    --     use(plugin)
    -- end
end

local function sync_packer()
    if bootstrap then
        packer.sync()
    end
end

packer.startup(function(use)
    setup_plugins(use)
    sync_packer()
end)
