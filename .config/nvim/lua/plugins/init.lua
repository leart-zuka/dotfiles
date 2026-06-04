return {
    {
        "xiyaowong/transparent.nvim",
        config = function()
            vim.cmd([[TransparentEnable]])
        end
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {},
    },
    {
        'echasnovski/mini.nvim', version = false
    }
}
