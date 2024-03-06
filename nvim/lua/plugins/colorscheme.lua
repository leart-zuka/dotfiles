return {
    "navarasu/onedark.nvim",
    init = function()
        require('onedark').setup {
            style = 'deep',
            highlights = {
                DashboardHeader = { fg = '#91a3e3' },
                DashboardKey = { fg = '#EA3C53' },
                DashboardIcon = { fg = '#EA3C53' },
                DashboardFooter = { fg = '#d8c8d5' },

            }
        }
        require('onedark').load()
    end,
    config = function()
        vim.cmd([[colorscheme onedark]])
    end
}
