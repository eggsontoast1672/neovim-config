local M = {}

M.setup = function()
    local bootstrap = require("eggs.bootstrap").ensure_packer()
    local packer = require("packer")
    local plugins = require("eggs.settings").plugins
    packer.startup(function(use)
        use("wbthomason/packer.nvim")
	for _, plugin in pairs(plugins) do
            use(plugin)
	end
	if bootstrap then
	    packer.sync()
	end
    end)
end

return M
