" Title: Example Plugin
" Description: A Example Plugin for Neovim
" Last Change: dd mm yyyy
" Maintainer: Example Plugin <https://github.com/{USERMAME}/{EXAMPLE_PLUGIN}>

if exists("g:loaded_example_plugin") | finish | endif

let s:save_cpo = &cpo

set cpo&vim
 
" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/example-plugin/deps"

exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

command! ExamplePluginFunc lua require("example-plugin.nvim").func()
command! ExamplePluginHelp lua require("example-plugin.nvim").help()

let s:save_cpo = &cpo

set cpo&vim

let g:loaded_example_plugin = 1
