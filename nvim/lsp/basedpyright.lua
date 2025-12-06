local lsp = require("config.lsp")

return {
  cmd = { "basedpyright", "--stdio" },

  filetypes = { "python" },

  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace",
      },
    },
  },

  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
}
