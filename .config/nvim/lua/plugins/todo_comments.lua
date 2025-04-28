return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {},
    init = function()
        require("todo-comments").setup()
        vim.keymap.set('n', '<leader>tf', '<Cmd>TodoLocList<CR>')
    end
}
