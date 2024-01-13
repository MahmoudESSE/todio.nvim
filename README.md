# todio.nvim

`todio.nvim` a neovim plugin to help keep track of your todos.

## Features

- Add todo to list
- View todo list
- Finish todos
- Delete todos

## Requirements

    - [Neovim-0.9+](https://github.com/neovim/neovim)
    - [nui.nvim](https://github.com/MunifTanjim/nui.nvim)

## Installation

<!-- setup:start -->

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

<!-- setup:end -->

## Configuration

**todio.nvim** is fully configurable. Refer to the default setup:

<details>
    <summary>Default Settings</summary>

<!-- config:start -->

    ```lua
    {

    }

    ```

<!-- config:start -->

</details>

## Usage

```lua
require("todio").func()
```

## Command

```console
TodioHelp
```

## API

```lua
require("todio").help()
```
