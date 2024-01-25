local M = {}

---@param bufnr integer number of buffer to parse for symbols defaults to `0`
---@param first integer  start position of the parser
---@param last integer last position of the parser
local get_todos = function(bufnr, first, last)
  -- TODO: handle multiple langs
  local query_string = '((comment) @comment (#match? @comment "TODO:"))'

  local parser = require("nvim-treesitter.parsers").get_parser()

  local ok, query = pcall(vim.treesitter.query.parse, parser:lang(), query_string)
  if not ok then
    return {}
  end

  local tree = parser:parse()[1]

  ---@type table<string>
  local qflist = {}

  for _, node, metadata in query:iter_captures(tree:root(), bufnr, first, last) do
    local text = vim.treesitter.get_node_text(node, bufnr, metadata)
    local lnum, col = node:range()

    table.insert(qflist, {
      bufnr = vim.api.nvim_get_current_buf(),
      text = text,
      lnum = lnum + 1,
      col = col + 1,
      type = "T",
    })
  end

  return qflist
end

local todos = function()
  local ok, qflist = pcall(M.get_todos, 0, 0, 10)
  if not ok then
    return
  end

  vim.fn.setqflist(qflist)
  vim.cmd.copen()
end

M.get_todos = get_todos
M.todos = todos

return M
