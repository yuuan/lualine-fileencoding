# lualine-fileencoding

A [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) component that
merges the built-in `fileformat` and `fileencoding` components into a single
segment so you can show both without spending two slots on your statusline.

## Features

- Displays `<fileformat> <encoding>` (e.g. ` utf-8`).
- Falls back to text (`unix utf-8`) when `icons_enabled = false`.
- Appends `[BOM]` for BOM-marked files when `show_bomb = true`.
- `symbols` option to override the `unix` / `dos` / `mac` icons.

## Requirements

- Neovim
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

## Installation

Add this plugin as a dependency of `lualine.nvim` so it is loaded before
`lualine`'s `setup()` resolves component names.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "yuuan/lualine-fileencoding" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = { "fileencoding", "filetype" },
      },
    })
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "nvim-lualine/lualine.nvim",
  requires = { "yuuan/lualine-fileencoding" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_x = { "fileencoding", "filetype" },
      },
    })
  end,
}
```

## Usage

Reference the component by its name (`"fileencoding"`) in any lualine section:

```lua
sections = {
  lualine_x = { "fileencoding", "filetype" },
}
```

The component name (`fileencoding`) shadows lualine's built-in component of the
same name, so existing configurations that reference `"fileencoding"` will pick
this one up automatically once the plugin is loaded.

## Options

| Option      | Type    | Default | Description                                                 |
| ----------- | ------- | ------- | ----------------------------------------------------------- |
| `show_bomb` | boolean | `false` | Append `[BOM]` when the current buffer has a byte-order mark. |
| `symbols`   | table   | see below | Icons used for each `fileformat` value.                 |

Default `symbols`:

```lua
{
  unix = '', -- e712
  dos = '', -- e70f
  mac = '', -- e711
}
```

### Example with options

```lua
require("lualine").setup({
  sections = {
    lualine_x = {
      {
        "fileencoding",
        show_bomb = true,
        symbols = {
          unix = "LF",
          dos  = "CRLF",
          mac  = "CR",
        },
      },
    },
  },
})
```

## Credits

Derived from lualine.nvim's built-in components:

- `lua/lualine/components/encoding.lua` by [hoob3rt](https://github.com/hoob3rt)
- `lua/lualine/components/fileformat.lua` by [shadmansaleh](https://github.com/shadmansaleh)

## License

MIT. See [LICENSE](./LICENSE).
