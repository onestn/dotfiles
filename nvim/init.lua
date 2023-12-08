-- import .vimrc
vim.cmd("source ~/.vimrc")

-- map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("dead-line.core")
require("dead-line.lazy")
