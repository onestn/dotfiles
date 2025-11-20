return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

      vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.HINT]  = "󰠠 ",
          [vim.diagnostic.severity.INFO]  = " ",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP references" }))
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP definitions" }))
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP implementations" }))
      vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP type definitions" }))

      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "See available code actions" }))
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Smart rename" }))
      vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", vim.tbl_extend("force", opts, { desc = "Show buffer diagnostics" }))
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show line diagnostics" }))
      vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show documentation for what is under cursor" }))
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    vim.lsp.config('pylsp', {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        pylsp = {
          pycodestyle = { enabled = false },
          pyflakes = { enabled = false },
          mccabe = { enabled = false },
          pylint = { enabled = false },
          yapf = { enabled = false },
          autopep8 = { enabled = false },
        },
      },
    })
    vim.lsp.enable('pylsp')

    vim.lsp.config('ruff', {
      capabilities = capabilities,
      on_attach = on_attach,
      init_options = {
        settings = {
          lint = {
            enable = true,
            ignore = {
              "F403",
              "F405",
            },
          },
        },
      },
    })
    vim.lsp.enable('ruff')
  end,
}
