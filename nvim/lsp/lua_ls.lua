local lsp = require("config.lsp")

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    { ".luarc.json", ".luarc.jsonc" },
    ".git"
  },

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      signatureHelp = { enabled = true },
    },
  },

  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
}
