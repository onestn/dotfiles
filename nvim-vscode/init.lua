-- import .vimrc
vim.cmd("source ~/.vimrc")

-- Map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Require Neovim's API
local vim = vim

-- Add Quickscope
vim.cmd("packadd quickscope")

-- Load settings file
dofile(vim.fn.stdpath('config') .. '/lua/settings.lua')

-- Manage editor size
local function manage_editor_size(count, to)
    count = count or 1
    local action = to == 'increase' and 'workbench.action.increaseViewSize' or 'workbench.action.decreaseViewSize'
    for i = 1, count do
        vim.api.nvim_exec('VSCodeNotify ' .. action, false)
    end
end

-- VSCode commentary function
local function vscode_commentary(line1, line2)
    line1 = line1 or vim.fn.line("'[")
    line2 = line2 or vim.fn.line("']")
    vim.api.nvim_exec('VSCodeCallRange "editor.action.commentLine" ' .. line1 .. ' ' .. line2 .. ' 0', false)
end

-- Function to open VSCode commands in visual mode
local function open_vscode_commands_in_visual_mode()
    vim.cmd('normal! gv')
    local visualmode = vim.fn.visualmode()
    if visualmode == "V" then
        local startLine = vim.fn.line("v")
        local endLine = vim.fn.line(".")
        vim.api.nvim_exec('VSCodeNotifyRange "workbench.action.showCommands" ' .. startLine .. ' ' .. endLine .. ' 1', false)
    else
        local startPos = vim.fn.getpos("v")
        local endPos = vim.fn.getpos(".")
        vim.api.nvim_exec('VSCodeNotifyRangePos "workbench.action.showCommands" ' .. startPos[1] .. ' ' .. endPos[1] .. ' ' .. startPos[2] .. ' ' .. endPos[2] .. ' 1', false)
    end
end

-- Bind keys for better navigation and other functionalities
vim.api.nvim_set_keymap('n', '<C-j>', ':lua VSCodeNotify("workbench.action.navigateDown")<CR>', {silent = true})
vim.api.nvim_set_keymap('x', '<C-j>', ':lua VSCodeNotify("workbench.action.navigateDown")<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':lua VSCodeNotify("workbench.action.navigateUp")<CR>', {silent = true})
vim.api.nvim_set_keymap('x', '<C-k>', ':lua VSCodeNotify("workbench.action.navigateUp")<CR>', {silent = true})

-- Continue adding other mappings and functions as needed

-- Set clipboard to unnamedplus
vim.o.clipboard = "unnamedplus"
