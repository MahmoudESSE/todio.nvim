# 💫 todio.nvim

`todio.nvim` a neovim plugin to help keep track of your todos,
using tree sitter instead of regex.

## ✨ Features

- Parse todos from file
- List todos in a quick fix list

## 📑 Requirements

- [Neovim-0.9+](https://github.com/neovim/neovim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## 📦 Installation

You can install `todio.nvim` using your favorite plugin manager:

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

- display the current buffer's todos in the console

```lua
require("todio").todos()
```

- open the current buffer's quick fix list with the todo

```lua
require("todio").open_qflist()
```

## 🔭 Command

TodioQf
TodioTodos

## 📡 API

- parse current buffer's todos and return them in a table

```lua
require("todio.search").parse_todos()
```

- get table with the todos text only

```lua
require("todio.search").get_todos()
```

- get constructed quick fix list

```lua
require("todio.search").get_qflist()
```

## 📓 Logging

- logs are written to `todio.log` inside neovim default cache `:echo stdpath('cache')`

## 🤖 Todo

- [ ] add support for multiple languages
  - [x] lua
  - [ ] c
  - [ ] cpp
  - [ ] rust
  - [ ] python
  - [ ] js
  - [ ] ts
- [x] open todo list in quick fix list
- [ ] open todo list in location list
- [ ] open todo list in float buffer

## Example

### Todo

example of todo object

```json
{
    {
        bufnr = 4,
        col = 4,
        lnum = 9,
        text = "-- TODO: Example",
        title = "Todo",
        type = "T"
    }
}
```

### c

```c
/// TODO: test for division by 0
/// BUG: change int to correct type
int div(int x, int y) {
    return x / y;
}
```

### lua

```lua
-- TODO: test for division by 0
-- BUG: could throw divided by zero err
local function div(lhs, rhs)
    return lhs / rhs
end
```
