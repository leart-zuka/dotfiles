return {
    "brenton-leighton/multiple-cursors.nvim",
    opts = {},
    keys = {
        { "<C-S-j>",       "<Cmd>MultipleCursorsAddDown<CR>",        mode = { "n", "x" }, desc = "Add cursor and move down" },
        { "<C-S-k>",       "<Cmd>MultipleCursorsAddUp<CR>",          mode = { "n", "x" }, desc = "Add cursor and move up" },
        { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },
    }
}
