return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ft = { "python" },
    opts = {},
    config = function()
        require('ibl').setup()
    end
}
