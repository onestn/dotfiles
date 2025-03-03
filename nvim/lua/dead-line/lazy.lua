require("lazy").setup({
  { import = "dead-line.plugins" },
  { import = "dead-line.plugins.lsp" },
  { import = "dead-line.plugins.themes" }
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
