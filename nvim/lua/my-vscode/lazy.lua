-- import plugins from ./plugins/*
require("lazy").setup({
}, {
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
})
