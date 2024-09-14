return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    init = function()
        vim.g.mkpd_browser = "firefox"
        vim.g.mkpd_theme = { "light" }
    end
}
