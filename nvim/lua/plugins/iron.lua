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
      keymaps = {
        send_motion    = "<leader>sc",
        visual_send    = "<leader>sc",
        send_line      = "<leader>sl",
        send_paragraph = "<leader>sp",
        send_file      = "<leader>sf",
        cr             = "<leader>s<cr>",
        interrupt      = "<leader>si",
        exit           = "<leader>sq",
        clear          = "<leader>sk",
      },
    })

    vim.keymap.set("n", "<leader>sr", function()
      require("iron.core").repl_for(vim.bo.filetype)   -- 현재 ft에 맞는 REPL 생성/재사용
      require("iron.core").focus_on("last")            -- 방금 연 REPL로 포커스
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

