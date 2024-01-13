" Title: Todio
" Description: A Todo Plugin for Neovim
" Last Change: 14 1 2024
" Maintainer: Todio.NVIM <https://github.com/MahmoudESSE/todio.nvim>

if exists("g:loaded_todio_plugin") | finish | endif

let s:save_cpo = &cpo

set cpo&vim
 
" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/todio/deps"

exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

command! TodioHelp lua require("todio").help()

let s:save_cpo = &cpo

set cpo&vim

let g:loaded_todio_plugin = 1
