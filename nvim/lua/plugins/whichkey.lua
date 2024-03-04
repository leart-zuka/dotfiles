return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        ignore_missing = true,
    },
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>"] = {
                p = {
                    name = "+file",
                    f = { "Find File" },
                    w = { "Find Word" },
                },
                l = {
                    name = "+latex",
                    l = { "Start/Stop Compilation" },
                    v = { "View PDF" },
                },
                g = {
                    name = "+git",
                    s = { "Open LazyGit" },
                },
            },
            ["<leader>w"] = { "<cmd>w<cr>", "Write File" },
            ["<leader>q"] = { "<cmd>q<cr>", "Quit Session" },
        })
    end
}
