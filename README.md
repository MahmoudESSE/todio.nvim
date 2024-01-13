# example-plugin.nvim

`example-plugin.nvim`

## Features

## Requirements

## Installation

<!-- setup:start -->

```lua
{
    "{USERNAME}/{EXAMPLE_PLUGIN}",
    opts = {},
    config = function()
        require("example-plugin").setup()
    end
}
```

<!-- setup:end -->

## Configuration

**example-plugin** is fully configurable. Refer to the default setup:

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
require("example-plugin").func()
```

## Command

```console
EXAMPLEPLUGINFUNC
EXAMPLEPLUGINHelp
```

## API

```lua
require("example-plugin").help()
```
