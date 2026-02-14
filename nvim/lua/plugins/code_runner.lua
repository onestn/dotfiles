return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        lua = "lua",
        python = "python -u",
        rust = 'if echo "$dir" | grep -q "/examples"; then cargo run --example $fileNameWithoutExt; else cargo run; fi',
      },
    })
  end,
}
