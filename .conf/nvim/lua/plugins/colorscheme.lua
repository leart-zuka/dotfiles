return {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    init = function()
        require('onedark').setup({
            style = 'deep',
            hightlights = {
                DashboardHeader = '#91A3E3',
                DashboardKey = '#EA3C53',
                DashboardIcon = '#EA3C53',
                DashboardFooter = '#D8C8D5',
            },
        })
        require('onedark').load()
        vim.cmd('highlight DashboardHeader guifg=#91a3e3')
        vim.cmd('highlight DashboardKey guifg=#EA3C53')
        vim.cmd('highlight DashboardIcon guifg=#EA3C53')
        vim.cmd('highlight DashboardFooter guifg=#d8c8d5')
    end,
}
