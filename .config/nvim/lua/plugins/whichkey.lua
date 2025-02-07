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
        wk.add(
            {
                { "<leader>d",   group = "debugger" },
                { "<leader>db",  desc = "Toggle breakpoint" },
                { "<leader>dc",  desc = "Continue" },
                { "<leader>do",  desc = "Toggle debugger" },
                { "<leader>f",   group = "filebrowser" },
                { "<leader>fb",  desc = "Open Filebrowser" },
                { "<leader>g",   group = "git" },
                { "<leader>gb",  desc = "List all branches with log preview" },
                { "<leader>gc",  desc = "List commits with diff" },
                { "<leader>gl",  desc = "Open LazyGit" },
                { "<leader>gs",  desc = "List current changes" },
                { "<leader>l",   group = "latex" },
                { "<leader>ll",  desc = "Start/Stop Compilation" },
                { "<leader>lv",  desc = "View PDF" },
                { "<leader>o",   group = "obsidian" },
                { "<leader>on",  desc = "Insert Template" },
                { "<leader>op",  group = "paste" },
                { "<leader>opi", desc = "Image" },
                { "<leader>os",  desc = "Search" },
                { "<leader>p",   group = "file" },
                { "<leader>pf",  desc = "Find File" },
                { "<leader>po",  desc = "Old Files" },
                { "<leader>pw",  desc = "Find Word" },
                { "<leader>q",   "<cmd>q<cr>",                               desc = "Quit Session" },
                { "<leader>w",   "<cmd>w<cr>",                               desc = "Write File" },
            }
        )
    end
}
