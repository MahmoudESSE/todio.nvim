# 💫 todio.nvim

`todio.nvim` a neovim plugin to help keep track of your todos.

## ✨ Features

- Add todo to list
- View todo list
- Finish todos
- Delete todos

## 📑 Requirements

- [Neovim-0.9+](https://github.com/neovim/neovim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)

## 📦 Installation

You can install `todio.nvim` using your favorite plugin manager

- [lazy.nvim](https://github.com/folke/lazy.nvim)

``` lua
{
    "MahmoudESSE/todio.nvim",
    ---@type TodioConfig
    opts = {},
    config = function(opts)
        require("todio").setup(opts)
    end,
    dependencies = {
       "MunifTanjim/nui.nvim",
    },
}
```

## 🚀 Usage

- list your todos

``` lua
require("todio").list()
```

- add a todo passing a title to it

``` lua
--- @param title string
require("todio").add(title)
```

- finish a todo with `id`  being the id of the todo

``` lua
--- @param id number
require("todio").finish(id)
```

## 🔭 Command

TodioHelp

## 📡 API

pull up a window with `help.txt`

``` lua
require("todio").help()
```

## 🤖 Todo

- [ ] add support for lsp to insert a todo inside you file in a comment

``` c
/// TODO: test for division by 0
    /// BUG: change int to correct type
    int div(int a, int b) {
    int res = a / b;
    return sum;
}
```
