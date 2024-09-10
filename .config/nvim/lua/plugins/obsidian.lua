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
    opts = {
        workspaces = {
            {
                name = "personal_notes",
                path = "/home/lz/Notes/",
            },
        },
    },
}
