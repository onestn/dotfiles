local lsp = require("config.lsp")

return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },

  root_markers = {
    "Cargo.toml",
    "rust-project.json",
    ".git",
  },

  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        enable = true,
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
    },
  },

  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
}
