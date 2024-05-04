return {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    init = function()
        require('onedark').setup({
            style = 'deep',
        })
        require('onedark').load()
        vim.cmd([[
            autocmd ColorScheme * highlight DashboardHeader guifg=#91A3E3
            autocmd ColorScheme * highlight DashboardKey guifg=#EA3C53
            autocmd ColorScheme * highlight DashboardIcon guifg=#EA3C53
            autocmd ColorScheme * highlight DashboardFooter guifg=#d8c8d5
        ]])
    end,
}
