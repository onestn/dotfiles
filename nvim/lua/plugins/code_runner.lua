return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        lua = "lua",
        python = "python -u",
        rust = function()
          local cargo = vim.fn.findfile("Cargo.toml", ".;")
          local cmd

          if cargo ~= "" then
            local dir = vim.fn.expand("%:p:h")
            local name = vim.fn.expand("%:t:r")
            if dir:find("/examples") then
              cmd = "cargo run --example " .. name
            else
              cmd = "cargo run"
            end
          else
            local file = vim.fn.expand("%:p")
            local out = "/tmp/" .. vim.fn.expand("%:t:r")
            cmd = "rustc " .. file .. " -o " .. out .. " && " .. out
          end

          require("code_runner.commands").run_from_fn(cmd)
        end,
      },
    })
  end,
}
