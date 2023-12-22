-- set lazy to available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- import plugins from ./user/plugins/*
require("lazy").setup({
  {import = "dead-line.themes"},
  {import = "dead-line.plugins"},
  {import = "dead-line.plugins.lsp"},
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- set theme from ./themes/*
vim.cmd.colorscheme "catppuccin-mocha"
