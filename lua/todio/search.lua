local logger = require("todio.log")
local util = require("todio.util")

local M = {}

--- Parse the `todos` of the current buffer to a list and return it
---@return table<TodioParsedTodo>
local parse_todos = function()
  -- TODO: handle multiple langs
  local query_string = '((comment) @comment (#match? @comment "TODO:"))'

  local parser = require("nvim-treesitter.parsers").get_parser()

  local ok, query = pcall(vim.treesitter.query.parse, parser:lang(), query_string)
  logger.info("got the list? " .. util.get_if_bool(ok, "true", "false"))
  if not ok then
    return {}
  end

  local tree = parser:parse()[1]
  local bufnr = vim.api.nvim_get_current_buf()
  local first, last = util.filesize()

  ---@type table<TodioParsedTodo>
  local todolist = {}

  for _, node, metadata in query:iter_captures(tree:root(), bufnr, first, last) do
    local text = vim.treesitter.get_node_text(node, bufnr, metadata)
    local lnum, col = node:range()

    table.insert(todolist, {
      bufnr = vim.api.nvim_get_current_buf(),
      text = text,
      lnum = lnum + 1,
      col = col + 1,
      type = "T",
    })
  end

  logger.info(todolist)

  return todolist
end

--- Get the list of the parsed `todos` with only the text
---@return table<TodioTodo>
local get_todos = function()
  local ok, list = pcall(parse_todos)
  logger.info("got the todo list? " .. util.get_if_bool(ok, "true", "false"))

  if not ok then
    return {}
  end

  local todolist = {}

  for _, v in ipairs(list) do
    table.insert(todolist, v.text)
  end

  logger.info(list)

  return todolist
end

--- Construct a quick fix list from the parsed `todos`
---@return table<TodioQfList>
local get_qflist = function()
  local ok, list = pcall(parse_todos)
  logger.info("got the quick fix list? " .. util.get_if_bool(ok, "true", "false"))

  if not ok then
    return {}
  end

  local qflist = {}

  for _, v in ipairs(list) do
    table.insert(qflist, {
      bufnr = vim.api.nvim_get_current_buf(),
      text = v.text,
      lnum = v.lnum + 1,
      col = v.col + 1,
      type = v.type,
    })
  end

  logger.info(qflist)

  return qflist
end

--- Construct a location list from the parsed `todos`
---@return table<TodioLocList>
local get_loclist = function()
  local ok, list = pcall(parse_todos)
  logger.info("got the location list? " .. util.get_if_bool(ok, "true", "false"))

  if not ok then
    return {}
  end

  ---@type table<TodioLocList>
  local loclist = {}

  for _, v in ipairs(list) do
    table.insert(loclist, {
      bufnr = vim.api.nvim_get_current_buf(),
      text = v.text,
      lnum = v.lnum + 1,
      col = v.col + 1,
      type = v.type,
    })
  end

  logger.info(loclist)

  return loclist
end

--- Open the current buffer quick fix list
local open_qflist = function()
  local ok, qflist = pcall(get_qflist)
  logger.trace("got the quick fix list? " .. util.get_if_bool(ok, "true", "false"))

  if not ok then
    return
  end

  logger.info(qflist)

  vim.fn.setqflist(qflist)
  vim.cmd.copen()
end

--- Open the current buffer loc list
local open_loclist = function()
  local ok, loclist = pcall(get_loclist)
  logger.trace("got the loc list? " .. util.get_if_bool(ok, "true", "false"))

  if not ok then
    return
  end

  logger.info(loclist)

  vim.fn.setloclist(0, loclist)
  vim.cmd.copen()
end

--- Print the todos to the console
local todos = function()
  local ok, todolist = pcall(get_todos, 0, 0, 10)
  logger.info("got the todo list? " .. util.get_if_bool(ok, "true", "false"))

  if not ok then
    return
  end

  logger.info(todolist)

  vim.print(todolist)
end

M.get_todos = get_todos
M.parse_todos = parse_todos
M.get_qflist = get_qflist
M.open_qflist = open_qflist
M.get_loclist = get_loclist
M.open_loclist = open_loclist
M.todos = todos

return M
