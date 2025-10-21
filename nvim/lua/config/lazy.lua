local plugin_specs = {
  { import = "plugins" },
  { import = "plugins.ui" },
  { import = "plugins.lsp" },
  { import = "plugins.themes" },
}
local lazy_opts = {
  defaults = { lazy = true },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = { notify = false },
}
require("lazy").setup(plugin_specs, lazy_opts)

vim.cmd.colorscheme("catppuccin-mocha")
