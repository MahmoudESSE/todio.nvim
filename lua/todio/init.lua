local M = {}

---@type TodioConfig
local TodioConfig = {}

---@param opts TodioConfig
local initialise = function(opts)
  local config = vim.tbl_deep_extend("force", TodioConfig, (opts or {}))
  return config
end


M.help = function()
  vim.print("HELP")
end

M.setup = function(opts)
  vim.print("Todio PLUGIN")

  initialise(opts)
end

return M
