local open_qflist = require("todio.search").open_qflist
local open_loclist = require("todio.search").open_loclist
local todos = require("todio.search").todos
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

M.setup = setup
M.todos = todos
M.open_qflist = open_qflist
M.open_loclist = open_loclist

return M
