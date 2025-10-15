return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "ruff",
        "lua_ls",
        "rust_analyzer"
      },
      automatic_installation = true, -- not the same as ensure_installed
    })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "black",
        },
      })
  end,
}
