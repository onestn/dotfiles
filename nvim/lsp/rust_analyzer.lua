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
        loadOutDirsFromCheck = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
      inlayHints = {
        bindingModeHints = { enable = true },
        closureReturnTypeHints = { enable = "always" },
        typeHints = { enable = true },
      },
    },
  },

  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
}
