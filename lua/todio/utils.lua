local M = {}

---@param bufnr integer number of buffer to parse for symbols defaults to `0`
---@param first integer  start position of the parser
---@param last integer last position of the parser
---@return table<TodioParsedTodo>
local parse_todos = function(bufnr, first, last)
  -- TODO: handle multiple langs
  local query_string = '((comment) @comment (#match? @comment "TODO:"))'

  local parser = require("nvim-treesitter.parsers").get_parser()

  local ok, query = pcall(vim.treesitter.query.parse, parser:lang(), query_string)
  if not ok then
    return {}
  end

  local tree = parser:parse()[1]

  ---@type table<TodioParsedTodo>
  local list = {}

  for _, node, metadata in query:iter_captures(tree:root(), bufnr, first, last) do
    local text = vim.treesitter.get_node_text(node, bufnr, metadata)
    local lnum, col = node:range()

    table.insert(list, {
      bufnr = vim.api.nvim_get_current_buf(),
      text = text,
      lnum = lnum + 1,
      col = col + 1,
      type = "T",
    })
  end

  return list
end

---@return table<TodioTodo>
local get_todos = function()
  local ok, list = pcall(parse_todos, 0, 0, 10)

  if not ok then
    return {}
  end

  local todolist = {}

  for key, _ in pairs(list) do
    table.insert(todolist, key.text)
  end

  return todolist
end

---@return table<TodioQfList>
local get_qflist = function()
  local ok, list = pcall(parse_todos, 0, 0, 10)

  if not ok then
    return {}
  end

  local qflist = {}

  for key, _ in pairs(list) do
    table.insert(qflist, {
      bufnr = vim.api.nvim_get_current_buf(),
      text = key.text,
      lnum = key.lnum + 1,
      col = key.col + 1,
      type = key.type,
    })
  end

  return qflist
end

local open_qf = function()
  local ok, qflist = pcall(get_qflist, 0, 0, 10)
  if not ok then
    return
  end

  vim.fn.setqflist(qflist)
  vim.cmd.copen()
end

local todos = function()
  local ok, todolist = pcall(get_todos, 0, 0, 10)
  if not ok then
    return
  end

  vim.print(todolist)
end

M.get_todos = get_todos
M.parse_todos = parse_todos
M.get_qflist = get_qflist
M.open_qf = open_qf
M.todos = todos

return M
