local keymap = vim.keymap

-- nvim-telescope/telescope.nvim
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })

-- szw/vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- nvim-tree/nvim-tree.lua
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- CRAG666/code_runner.nvim
keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

-- zbirenbaum/copilot.lua
require("copilot").setup({
  suggestion = {
    enabled = true,
    panel = { enabled = true },
    auto_trigger = true,
    keymap = {
      next = "<C-j>",
      prev = "<C-k>",
      accept = "<C-l>",
      dismiss = "<C-h>",
    },
  }
})
