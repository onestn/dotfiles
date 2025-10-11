# Dotfiles about Neovim configuration
---
> This folder include own setting files about Neovim to make PDE(Personalized Development Environment).

## Configuration of Neovim
This folder include own setting files about Neovim to make PDE(Personalized Development Environment). And you can also view on this file to my nvim file structure

### File Structure of Neovim
Structre is as follows(Like LazyVim Style)
```
~/.config/nvim
├── after/
|   └── ftplugin/
│       ├── rust.lua
│       └── python.lua
├── lua/
│   ├── config/
│   │   ├── lazy.lua
│   │   ├── keymaps.lua
│   │   └── options.lua
│   └── plugins/
│       ├── lsp/
│       |   ├── lspconfig.lua
│       |   └── mason.lua
│       ├── themes/
│       |   └── catppuccin.lua
│       ├── pluginA.lua
│       ├── **
│       └── pluginZ.lua
└── init.lua
```
