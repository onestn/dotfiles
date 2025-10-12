return {
  "Vigemus/iron.nvim",
  ft = { "python", "lua", "sh", "rust", "scala", "zig" },
  config = function()
    local iron = require("iron.core")
    iron.setup({
      config = {
        repl_definition = {
          python = { command = { "ipython", "--no-autoindent" } },
          lua    = { command = { "lua" } },
          sh     = { command = { "zsh" } },
	  rust   = { command = { "evcxr" } },
        },
        repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
        preferred = { "python", "lua", "sh", "rust" },
      },
      highlight = { italic = true },
      ignore_blank_lines = true,
    })

    vim.keymap.set("n", "<leader>sr", function()
      require("iron.core").repl_for(vim.bo.filetype)
      require("iron.core").focus_on("last")
    end, { desc = "REPL open/focus" })

    vim.keymap.set("n", "<leader>sh", function()
      require("iron.core").hide_repl()
    end, { desc = "REPL hide" })

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
      vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { buffer = true })
    end
    })

  end,
}

