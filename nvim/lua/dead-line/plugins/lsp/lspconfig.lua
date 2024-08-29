-- TODO: Move keymaps to lua/dead-line/mappings.lua
return {
    "neovim/nvim-lspconfig",
    event = { -- Quick loading
        "BufReadPre",
        "BufNewFile"
    },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local keymap = vim.keymap -- for conciseness
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
            keymap.set("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")

            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions")
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
            keymap.set("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
            keymap.set("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
            keymap.set("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = {
            Error = " ",
            Warn = " ",
            Hint = "󰠠 ",
            Info = " "
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        lspconfig["rust_analyzer"].setup({
            single_file_support = true,
            root_dir = lspconfig.util.root_pattern("Cargo.toml", ".git"),
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    assist = {
                        importGranularity = "module",
                        importPrefix = "by_self",
                    },
                    cargo = {
                        allFeatures = true,
                    },
                    procMacro = {
                        enable = true,
                    },
                },
            },
        })
    end,
}
