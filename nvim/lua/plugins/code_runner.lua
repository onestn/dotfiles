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
            cmd = "cargo run"
          else
            local file = vim.fn.expand("%:p")
            local name = vim.fn.expand("%:t:r")
            local out = "/tmp/" .. name
            cmd = "rustc " .. file .. " -o " .. out .. " && " .. out
          end
          require("code_runner.commands").run_from_fn(cmd)
        end,
      },
    })
  end,
}
