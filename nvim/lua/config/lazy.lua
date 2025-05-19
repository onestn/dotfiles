require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
  { import = "plugins.themes" }
}, {
  checker = {
    enabled = true,
    notify = false
  },
  change_detection = { notify = false },
})

vim.cmd[[colorscheme catppuccin-mocha]]
-- vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[colorscheme tokyodark]]
