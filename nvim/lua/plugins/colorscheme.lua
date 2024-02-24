return {
    "navarasu/onedark.nvim",
    init = function()
        require('onedark').setup{
            style = 'deep'
        }
        require('onedark').load()
    end,
    config = function() 
        vim.cmd([[colorscheme onedark]])
    end
}
