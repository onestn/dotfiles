local keymap = vim.keymap

-- nvim-telescope/telescope.nvim
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })

-- szw/vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- nvim-tree/nvim-tree.lua
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- CRAG666/code_runner.nvim
keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- -- zbirenbaum/copilot.lua
-- require("copilot").setup({
--   suggestion = {
--     enabled = true,
--     panel = { enabled = true },
--     auto_trigger = true,
--     keymap = {
--       next = "<C-j>",
--       prev = "<C-k>",
--       accept = "<C-l>",
--       dismiss = "<C-h>",
--     },
--   }
-- })


-- 특정 플러그인의 특정 기능을 매핑할 때는, 플러그인의 키맵 함수를 사용해야 한다.
-- keymap.set('i', '<C-something>', '<Cmd>lua require("copilot").accept()<CR>', { noremap = true, silent = true })

-- Dismiss Noice Message
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss Noice Message"})

-- comment.lua - Default Setting
-- {
--     ---Add a space b/w comment and the line
--     padding = true,
--     ---Whether the cursor should stay at its position
--     sticky = true,
--     ---Lines to be ignored while (un)comment
--     ignore = nil,
--     ---LHS of toggle mappings in NORMAL mode
--     toggler = {
--         ---Line-comment toggle keymap
--         line = 'gcc',
--         ---Block-comment toggle keymap
--         block = 'gbc',
--     },
--     ---LHS of operator-pending mappings in NORMAL and VISUAL mode
--     opleader = {
--         ---Line-comment keymap
--         line = 'gc',
--         ---Block-comment keymap
--         block = 'gb',
--     },
--     ---LHS of extra mappings
--     extra = {
--         ---Add comment on the line above
--         above = 'gcO',
--         ---Add comment on the line below
--         below = 'gco',
--         ---Add comment at the end of line
--         eol = 'gcA',
--     },
--     ---Enable keybindings
--     ---NOTE: If given `false` then the plugin won't create any mappings
--     mappings = {
--         ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
--         basic = true,
--         ---Extra mapping; `gco`, `gcO`, `gcA`
--         extra = true,
--     },
--     ---Function to call before (un)comment
--     pre_hook = nil,
--     ---Function to call after (un)comment
--     post_hook = nil,
-- }
