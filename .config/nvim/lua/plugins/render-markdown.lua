return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("render-markdown").setup({
            heading = {
                width = "block",
            },
            pipe_table = {
                border = { "╭", "┬", "╮", "├", "┼", "┤", "╰", "┴", "╯", "│", "─" },
            },
            code = {
                sign = false,
                style = "full",
                position = "right",
                width = "block",
                disable_background = { "diff" },
                left_pad = 2,
                right_pad = 2,
                border = "thin",
                above = '▄',
                below = '▀',
                highlight = 'RenderMarkdownCode',
                highlight_inline = 'RenderMarkdownCodeInline',
            },
        })
    end
}
