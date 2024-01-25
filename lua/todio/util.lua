local M = {}

-- Evaluate `bool` if true returns `lhs` else return `rhs`
---@param bool boolean
---@param lhs any
---@param rhs any
---@return any result `lhs` or `rhs`
local get_if_bool = function(bool, lhs, rhs)
  return bool and lhs or rhs
end

-- Evaluate `bool` if true calls `lhs` and returns the return value
-- else calls `rhs` and returns it's return value
---@param bool boolean
---@param lhs fun()
---@param rhs fun()
---@return any result value of `lhs` or `rhs`
local get_if_func = function(bool, lhs, rhs)
  return (bool and lhs or rhs)()
end

---@return integer, integer (fist pos in file, last pos in file)
local filesize = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local fsize = vim.fn.getfsize(bufname)
  local ftbl = {}
  table.insert(ftbl, 0)

  fsize = fsize < 0 and 0 or fsize

  if fsize < 1024 then
    table.insert(ftbl, fsize)
    return unpack(ftbl)
  end

  local i = math.floor((math.log(fsize) / math.log(1024)))
  local max = math.pow(1024, i)
  table.insert(ftbl, max)

  return unpack(ftbl)
end

M.get_if_bool = get_if_bool
M.get_if_func = get_if_func
M.filesize = filesize

return M
