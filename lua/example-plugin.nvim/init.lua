local M = {}

---@type ExamplePluginConfig
local ExamplePluginConfig = {}

---@param opts ExamplePluginConfig
local initialise = function(opts)
  local config = vim.tbl_deep_extend("force", ExamplePluginConfig, (opts or {}))
  return config
end

M.func = function()
  vim.print("FUNC")
  return
end

M.help = function()
  vim.print("HELP")
end

M.setup = function(opts)
  vim.print("EXAMPLE PLUGIN")

  initialise(opts)
end

return M
