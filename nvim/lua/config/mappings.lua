-- mapping helper
local function map(lhs, desc, fn, plugin)
  vim.keymap.set("n", lhs, fn, {
    desc = string.format("%s: %s", plugin, desc),
    silent = true,
  })
end

-- =======================================================
-- nvim-telescope/telescope: Fuzzy finder mappings
-- =======================================================
local PLUGIN = "Telescope"
map("<leader>ff", "Find files", function()
  require("telescope.builtin").find_files()
end, PLUGIN)

-- =======================================================
-- szw/vim-maximizer: Window manager
-- =======================================================
local PLUGIN = "Maximizer"
map("<leader>sm", "Toggle maximizer", "<cmd>MaximizerToggle<CR>", PLUGIN)

-- =======================================================
-- nvim-tree/nvim-tree: 
-- =======================================================
local PLUGIN = "NvimTree"
map("<leader>ee", "Toggle tree", function()
  require("nvim-tree.api").tree.toggle({ focus = true })
end, PLUGIN)

map("<leader>ef", "Toggle on current file", function()
  require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
end, PLUGIN)

map("<leader>ec", "Collapses tree(keep open buffer)", function()
  require("nvim-tree.api").tree.collapse_all({ keep_buffers = true })
end, PLUGIN)

map("<leader>er", "Refresh tree", function()
  require("nvim-tree.api").tree.reload()
end, PLUGIN)

-- =======================================================
-- CRAG666/code_runner: 
-- =======================================================
local PLUGIN = "CodeRunner"
map("<leader>rr", "Run code", function() 
  require("code_runner").run_code() 
end, PLUGIN)

map("<leader>rf", "Run file", function() 
  require("code_runner").run_from_fn() 
end, PLUGIN)

map("<leader>rft", "Run file tab", function() 
  require("code_runner").run_filetype() 
end, PLUGIN)

map("<leader>rp", "Run project", function() 
  require("code_runner").run_project() 
end, PLUGIN)

map("<leader>rc", "Run close", function() 
  require("code_runner").run_close() 
end, PLUGIN)

map("<leader>crf", "Get command for this filetype", function() 
  require("code_runner").get_filetype_command() 
end, PLUGIN)

map("<leader>crp", "Get command for this project", function()
  require("code_runner").get_project_command() 
end, PLUGIN)

-- =======================================================
-- folke/noice: 
-- =======================================================
local PLUGIN = "Noice"
map("<leader>nd", "Dismiss message", function()
  require("noice").cmd("dismiss")
end, PLUGIN)

-- =======================================================
-- jackMort/ChatGPT:
-- =======================================================
local PLUGIN = "ChatGPT"
map("<leader>oc", "Open window", ":ChatGPT<CR>", PLUGIN)

-- =======================================================
-- Vigemus/iron: Interative session
-- =======================================================
local PLUGIN = "Iron"
map("<leader>sc", "Send motion", function()
  require("iron.core").run_motion("send_motion")
end, PLUGIN)

-- TODO: map()에 모드 구분 가능하도록 변경하기
vim.keymap.set("v", "<leader>sc", function()
  require("iron.core").visual_send()
end, { desc = "Iron: Send motion with VISUAL", silent = true })

map("<leader>sl", "Send line", function()
  require("iron.core").send_line()
end, PLUGIN)

map("<leader>sp", "Send paragraph", function()
  require("iron.core").send_paragraph()
end, PLUGIN)

map("<leader>sf", "Send file", function()
  require("iron.core").send_file()
end, PLUGIN)

map("<leader>s<cr>", "CR", function()
  require("iron.core").send(nil, string.char(13))
end, PLUGIN)

map("<leader>si", "Interrupt", function()
  require("iron.core").send(nil, string.char(03))
end, PLUGIN)

map("<leader>sq", "Quit", function()
  require("iron.core").close_repl()
end, PLUGIN)

map("<leader>sk", "Clear", function()
  require("iron.core").send(nil, string.char(12))
end, PLUGIN)

-- =======================================================
-- CUSTOM MAPPINGS
-- =======================================================
map("gl", "Show diagnostic", function() 
  vim.diagnostic.open_float(0, { scope = "line" }) 
end, "Diagnostic")

