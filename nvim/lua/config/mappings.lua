-- mapping helper
local function map(lhs, desc, fn)
  desc = (desc and #desc > 0) and desc or "No description"
  vim.keymap.set("n", lhs, fn, { desc = desc, silent = true })
end

-- nvim-telescope/telescope
map("<leader>ff", "Fuzzy find files in cwd", "<cmd>Telescope find_files<CR>")
map("<leader>fr", "Fuzzy find recent files", "<cmd>Telescope oldfiles<CR>")
map("<leader>fs", "Find string in cwd", "<cmd>Telescope live_grep<CR>")
map("<leader>fc", "Find string under cursor in cwd", "<cmd>Telescope grep_string<CR>")

-- szw/vim-maximizer
map("<leader>sm", "Maximize/minimize a split", "<cmd>MaximizerToggle<CR>")

-- nvim-tree/nvim-tree.lua
map("<leader>ee", "Toggle nvim-tree", function()
  require("nvim-tree.api").tree.toggle({ focus = true })
end)
map("<leader>ef", "Toggle on current file", function()
  require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
end)
map("<leader>ec", "Collapses nvim-tree(keep open buffer)", function()
  require("nvim-tree.api").tree.collapse_all({ keep_buffers = true })
end)
map("<leader>er", "Refresh nvim-tree", function()
  require("nvim-tree.api").tree.reload()
end)

-- CRAG666/code_runner.nvim
map("<leader>rr", "Run code", function() 
  require("code_runner").run_code() 
end)
map("<leader>rf", "Run file", function() 
  require("code_runner").run_from_fn() 
end)
map("<leader>rft", "Run file tab", function() 
  require("code_runner").run_filetype() 
end)
map("<leader>rp", "Run project", function() 
  require("code_runner").run_project() 
end)
map("<leader>rc", "Run close", function() 
  require("code_runner").run_close() 
end)
map("<leader>crf", "Gee command for this filetype", function() 
  require("code_runner").get_filetype_command() 
end)
map("<leader>crp", "Get command for this project", function()
  require("code_runner").get_project_command() 
end)

-- Dismiss Noice Message
map("<leader>nd", "Dismiss Noice Message", "<cmd>NoiceDismiss<CR>")

-- jackMort/ChatGPT
map("<leader>oc", "Open ChatGPT Window", ":ChatGPT<CR>")

-- diagnostics
map("gl", "Show diagnostic", function() 
  vim.diagnostic.open_float(0, { scope = "line" }) 
end)

