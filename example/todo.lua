-- TODO: populate the todo list
-- TODO don't parse this
-- TODO: with these todos
local query_string = '((comment) @comment (#match? @comment "TODO:"))'

local parser = require("nvim-treesitter.parsers").get_parser()

local query = vim.treesitter.query.parse(parser:lang(), query_string)
local tree = parser:parse()[1]
local bufnr = 0
local first = 0
local last = 10

for _, node, metadata in query:iter_captures(tree:root(), bufnr, first, last) do
  local content = vim.treesitter.get_node_text(node, bufnr, metadata)

  vim.print(content)
end
