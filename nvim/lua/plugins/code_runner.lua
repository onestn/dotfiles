return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        lua = "lua",
        python = "python -u",
        rust = "cargo run",
      },
    })
  end,
}
