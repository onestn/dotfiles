return {
  "Vigemus/iron.nvim",
  -- REPL 쓸 파일타입에서만 로드(원하면 더 추가)
  ft = { "python", "lua", "sh", "rust", "scala", "zig" },
  config = function()
    local iron = require("iron.core")
    iron.setup({
      -- 핵심 동작 설정
      config = {
        -- 각 언어별 REPL 실행 커맨드(사내 경로로 바꿔도 됨)
        repl_definition = {
          python = { command = { "python" } },      -- or {"ipython", "--no-autoindent"}
          lua    = { command = { "lua" } },
          sh     = { command = { "bash" } },        -- zsh 등으로 변경 가능
        },
        -- REPL 창 여는 방식(세로 split, 아래쪽 40%)
        repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
        -- 기본으로 쓸 REPL 우선순위(선택)
        preferred = { "python", "lua", "sh" },
      },
      -- 하이라이트(선택)
      highlight = { italic = true },
      -- 빈 줄은 전송 안 함
      ignore_blank_lines = true,
      -- iron 자체 키맵(원하는 대로 바꿔)
      keymaps = {
        send_motion  = "<leader>sc",
        visual_send  = "<leader>sc",
        send_line    = "<leader>sl",
        send_paragraph = "<leader>sp",
        send_file    = "<leader>sf",
        cr           = "<leader>s<cr>",
        interrupt    = "<leader>si",
        exit         = "<leader>sq",
        clear        = "<leader>sk",
      },
    })

    -- 편의: REPL 토글/포커스용 명령 키맵(iron API 직접 호출)
    vim.keymap.set("n", "<leader>sr", function()
      require("iron.core").repl_for(vim.bo.filetype)   -- 현재 ft에 맞는 REPL 생성/재사용
      require("iron.core").focus_on("last")            -- 방금 연 REPL로 포커스
    end, { desc = "REPL open/focus" })

    vim.keymap.set("n", "<leader>sh", function()
      require("iron.core").hide_repl()
    end, { desc = "REPL hide" })
  end,
}

