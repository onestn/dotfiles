return {
  "Vigemus/iron.nvim",
  ft = { "python", "lua", "sh", "rust", "scala", "zig" },
  config = function()
    local iron = require("iron.core")
    iron.setup({
      config = {
        repl_definition = {
          python = { command = {
            "uv",
            "run",
            "ipython",
            "--no-autoindent"
            },
          },
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
  end,
}

