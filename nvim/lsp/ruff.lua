local lsp = require("config.lsp")

return {
  cmd = { "ruff" },
  filetypes = { "python" },

  init_options = {
    settings = {
      logLevel = "warning",
      lint = {
        enable = true,
        ignore = { "F403", "F405" },
      },
    },
  }
  ,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
}
