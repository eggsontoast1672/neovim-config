local bootstrap = require("core.bootstrap").ensure_packer()
local packer = require("packer")

packer.startup(function(use)
    use("wbthomason/packer.nvim")

    local plugins = require("config.plugins")
    for _, plugin in pairs(plugins) do
        use(plugin)
    end

    if bootstrap then
        packer.sync()
    end
end)
