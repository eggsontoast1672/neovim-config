local M = {}

---@param colorscheme string
local log_colorscheme_error = function(colorscheme)
    vim.notify(string.format("Failed to load colorscheme %s", colorscheme))
end

---@param colorscheme string
local setup_plugin_colorscheme = function(colorscheme)
    local status_ok, colorscheme_plugin = pcall(require, string.format("eggs.plugins.%s", colorscheme))
    if not status_ok then
        log_colorscheme_error(colorscheme)
        return
    end
    colorscheme_plugin.setup()
end

---@param colorscheme string
local setup_colorscheme = function(colorscheme)
    local status_ok = pcall(vim.cmd.colorscheme, colorscheme)
    if not status_ok then
        log_colorscheme_error(colorscheme)
    end
end

-- If colorscheme is a built-in neovim colorscheme, passing is_plugin = true
-- will break. However, if colorscheme is a plugin colorscheme, passing
-- is_plugin = false will not necessarily break, but all configurations for
-- that colorscheme will be ignored.
---@param colorscheme string
---@param opts { is_plugin: boolean }
M.setup = function(colorscheme, opts)
    if opts.is_plugin then
        setup_plugin_colorscheme(colorscheme)
        return
    end
    setup_colorscheme(colorscheme)
end

return M
