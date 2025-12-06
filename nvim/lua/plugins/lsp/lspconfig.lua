local lsp_servers = require("util.lsp_servers")

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },

  config = function()
    local common = require("config.lsp")
    common.setup_diagnostics()

    local servers = lsp_servers.get_servers()
    vim.lsp.enable(servers)
  end,
}
