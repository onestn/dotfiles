-- import plugins from ./plugins/*
require("lazy").setup({
    { import = "dead-line.plugins" },
    { import = "dead-line.plugins.lsp" },
    { import = "dead-line.plugins.themes" }
}, {
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
})

-- set theme from ./plugins/themes/*
vim.cmd.colorscheme "catppuccin-mocha"
