-- mapping helper
local function map(mode, lhs, desc, fn, plugin)
  vim.keymap.set(mode, lhs, fn, {
    desc = string.format("%s: %s", plugin, desc),
    silent = true,
  })
end

-- nvim-telescope/telescope
local PLUGIN = "Telescope"
map("n", "<leader>ff", "Find files", function()
  require("telescope.builtin").find_files()
end, PLUGIN)

-- akinsho/toggleterm
PLUGIN = "ToggleTerm"
map("n", "<leader>tt", "Toggle Terminal", "<cmd>ToggleTerm<cr>", PLUGIN)

-- nvim-tree/nvim-tree
PLUGIN = "NvimTree"
map("n", "<leader>ee", "Toggle tree", function()
  require("nvim-tree.api").tree.toggle({ focus = true })
end, PLUGIN)

map("n", "<leader>ef", "Toggle on current file", function()
  require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
end, PLUGIN)

map("n", "<leader>ec", "Collapses tree(keep open buffer)", function()
  require("nvim-tree.api").tree.collapse_all({ keep_buffers = true })
end, PLUGIN)

map("n", "<leader>er", "Refresh tree", function()
  require("nvim-tree.api").tree.reload()
end, PLUGIN)

-- CRAG666/code_runner
PLUGIN = "CodeRunner"
map("n", "<leader>rr", "Run code", function()
  require("code_runner").run_code()
end, PLUGIN)

map("n", "<leader>rf", "Run file", function()
  require("code_runner").run_from_fn()
end, PLUGIN)

map("n", "<leader>rft", "Run file tab", function()
  require("code_runner").run_filetype()
end, PLUGIN)

map("n", "<leader>rp", "Run project", function()
  require("code_runner").run_project()
end, PLUGIN)

map("n", "<leader>rc", "Run close", function()
  require("code_runner").run_close()
end, PLUGIN)

map("n", "<leader>crf", "Get command for this filetype", function()
  require("code_runner").get_filetype_command()
end, PLUGIN)

map("n", "<leader>crp", "Get command for this project", function()
  require("code_runner").get_project_command()
end, PLUGIN)

-- folke/noice
PLUGIN = "Noice"
map("n", "<leader>nd", "Dismiss message", function()
  require("noice").cmd("dismiss")
end, PLUGIN)

-- jackMort/ChatGPT
PLUGIN = "ChatGPT"
map("n", "<leader>oc", "Open window", "<cmd>ChatGPT<cr>", PLUGIN)

-- Vigemus/iron
PLUGIN = "Iron"
map("n", "<leader>sc", "Send motion", function()
  require("iron.core").run_motion("send_motion")
end, PLUGIN)

map("v", "<leader>sc", "Send motion with VISUAL", function()
  require("iron.core").visual_send()
end, PLUGIN)

map("n", "<leader>sl", "Send line", function()
  require("iron.core").send_line()
end, PLUGIN)

map("n", "<leader>sp", "Send paragraph", function()
  require("iron.core").send_paragraph()
end, PLUGIN)

map("n", "<leader>sf", "Send file", function()
  require("iron.core").send_file()
end, PLUGIN)

map("n", "<leader>s<cr>", "CR", function()
  require("iron.core").send(nil, string.char(13))
end, PLUGIN)

map("n", "<leader>si", "Interrupt", function()
  require("iron.core").send(nil, string.char(03))
end, PLUGIN)

map("n", "<leader>sq", "Quit", function()
  require("iron.core").close_repl()
end, PLUGIN)

map("n", "<leader>sk", "Clear", function()
  require("iron.core").send(nil, string.char(12))
end, PLUGIN)

map("n", "<leader>sr", "Open/Focus REPL", function()
  require("iron.core").repl_for(vim.bo.filetype)
  require("iron.core").focus_on("last")
end, PLUGIN)

map("n", "<leader>sh", "Hide REPL", function()
  require("iron.core").hide_repl()
end, PLUGIN)

-- declancm/maximize.nvim
PLUGIN = "Maximize"
map("n", "<leader>m", "Toggle maximize", function()
  require("maximize").toggle()
end, PLUGIN)

-- coder/claudecode.nvim
PLUGIN = "ClaudeCode"
map("n", "<leader>ac", "Toggle Claude terminal", "<cmd>ClaudeCode<cr>", PLUGIN)
map("n", "<leader>af", "Focus Claude terminal", "<cmd>ClaudeCodeFocus<cr>", PLUGIN)
map("n", "<leader>ar", "Resume previous session", "<cmd>ClaudeCode --resume<cr>", PLUGIN)
map("n", "<leader>aC", "Continue session", "<cmd>ClaudeCode --continue<cr>", PLUGIN)
map("n", "<leader>am", "Select model", "<cmd>ClaudeCodeSelectModel<cr>", PLUGIN)
map("n", "<leader>ab", "Add current file to context", "<cmd>ClaudeCodeAdd %<cr>", PLUGIN)
map("n", "<leader>aa", "Accept proposed changes", "<cmd>ClaudeCodeDiffAccept<cr>", PLUGIN)
map("n", "<leader>ad", "Deny proposed changes", "<cmd>ClaudeCodeDiffDeny<cr>", PLUGIN)
map("v", "<leader>as", "Send visual selection", "<cmd>ClaudeCodeSend<cr>", PLUGIN)

-- custom mappings
map("n", "gl", "Show diagnostic", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, "Diagnostic")
