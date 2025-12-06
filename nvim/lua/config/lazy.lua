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

do
  local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
  if not vim.env.PATH:find(mason_bin, 1, true) then
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
  end
end

vim.cmd.colorscheme("catppuccin-mocha")
