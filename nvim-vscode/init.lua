if vim.g.vscode then
    print("Neovim is running inside VSCode")
    -- VSCode extension
    require("options") 
else
    -- ordinary Neovim
end

-- import .vimrc
vim.cmd("source ~/.vimrc")