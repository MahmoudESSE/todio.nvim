local get_todos = require("todio.utils").get_todos
local todos = require("todio.utils").todos
local M = {}

---@type TodioConfig
local defaults = { position = "bottom" }

---@type TodioConfig
M.opts = {}

---@param opts TodioConfig
local init = function(opts)
  M.opts = vim.tbl_deep_extend("force", {}, defaults, opts)
end

---@param opts TodioConfig
local setup = function(opts)
  init(opts)
end

M.get_todos = get_todos
M.todos = todos
M.setup = setup

return M
