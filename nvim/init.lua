-- import .vimrc
vim.cmd("source ~/.vimrc")

-- import settings
require("dead-line.lazy")
require("dead-line.mappings")

-- Map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set indentation per programming langs
-- Lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
-- Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})
