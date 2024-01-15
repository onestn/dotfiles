USER_PROFILE = "dead-line"

-- import .vimrc
vim.cmd("source ~/.vimrc")

-- Map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- import settings
-- TODO: Why does <leader> not work to change top line to declare
require(USER_PROFILE .. ".lazy")
require(USER_PROFILE .. ".mappings")
