return {
    "OXY2DEV/markview.nvim",
    lazy = false,    -- Recommended
    ft = "markdown", -- If you decide to lazy-load anyway

    dependencies = {
        "nvim-treesitter/nvim-treesitter",

        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        vim.cmd("Markview enableAll");
        vim.api.nvim_create_autocmd("User", {
            pattern = "MarkviewAttach",
            callback = function(event)
                local data = event.data;
            end
        })
    end
}
