local lsp_servers = require("util.lsp_servers")

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
  },

  opts = function(_, opts)
    opts.ensure_installed = lsp_servers.get_servers()
    return opts
  end,
}
