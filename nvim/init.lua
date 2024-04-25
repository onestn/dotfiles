if vim.g.vscode then
  print("Neovim is running inside VSCode")
  USER_PROFILE = "vscode"
else
  USER_PROFILE = "dead-line"
end

-- import .vimrc
vim.cmd("source ~/.vimrc")

-- Map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- import settings
require(USER_PROFILE .. ".lazy")
require(USER_PROFILE .. ".mappings")