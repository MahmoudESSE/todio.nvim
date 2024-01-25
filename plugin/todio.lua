-- if exists("g:loaded_todio_plugin") | finish | endif
--
-- let s:save_cpo = &cpo
--
-- set cpo&vim
--
-- " Defines a package path for Lua. This facilitates importing the
-- " Lua modules from the plugin's dependency directory.
-- let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/todio/deps"
--
-- exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"
--
-- command! TodioHelp lua require("todio").help()
--
-- let s:save_cpo = &cpo
--
-- set cpo&vim
--
-- let g:loaded_todio_plugin = 1
if vim.g.loaded_todio_plugin == 1 then
  return
end

if vim.fn.has("nvim-0.9.0") ~= 1 then
  vim.api.nvim_err_writeln("todio.nvim requires at least neovim-0.9.0")
end

local TodioLoad = vim.api.nvim_create_augroup("TodioLoad", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_create_user_command("TodioTodos", function()
      vim.cmd([[
          lua require("todio").todos()
      ]])
    end, {})

    vim.api.nvim_create_user_command("TodioQfList", function()
      vim.cmd([[
          lua require("todio").open_qflist()
      ]])
    end, {})

    vim.api.nvim_create_user_command("TodioLocList", function()
      vim.cmd([[
          lua require("todio").open_loclist()
      ]])
    end, {})
  end,
  group = TodioLoad,
  pattern = "*",
  desc = "Load todio.nvim utils to rtplugin",
})

vim.g.loaded_todio_plugin = 1
