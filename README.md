# 💫 todio.nvim

`todio.nvim` a neovim plugin to help keep track of your todos.

## ✨ Features

- Parse todos from file
- List todos in a quick fix list

## 📑 Requirements

- [Neovim-0.9+](https://github.com/neovim/neovim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## 📦 Installation

You can install `todio.nvim` using your favorite plugin manager

- [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
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

```lua
require("todio").todos()
```

## 🔭 Command

TodioHelp

## 📡 API

get parsed todos

```lua
require("todio.utils").get_todos()
```

## 🤖 Todo

- [ ] add support for multiple languages
  - [ ] c
  - [ ] cpp
  - [ ] rust
  - [ ] python
  - [ ] js
  - [ ] ts

```c
/// TODO: test for division by 0
/// BUG: change int to correct type
int div(int a, int b) {
    int res = a / b;
    return sum;
}
```
