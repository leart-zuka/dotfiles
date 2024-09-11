return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",
    config = function()
        vim.keymap.set('n', '<leader>os', '<Cmd>ObsidianSearch<CR>', { silent = true })
        vim.keymap.set('n', '<leader>opi', '<Cmd>ObsidianPasteImg<CR>', { silent = true })
        vim.keymap.set('n', '<leader>on', '<Cmd>ObsidianTemplate main<CR>', { silent = true })
    end,
    init = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "Notes",
                    path = "$HOME/Documents/Notes/"
                }
            },
            templates = {
                subdir = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M:%S"
            },
            disable_frontmatter = true,
        })
    end
}
