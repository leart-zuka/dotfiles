return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"

        vim.g.vimtex_quickfix_ignore_filters = {
            "Warning",
            "Package.*Warning",
            "Underfull",
            "Overfull",
            "LaTeX Warning",
        }
    end,
    config = function()
        vim.api.nvim_create_autocmd({ "FileType" }, {
            group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
            pattern = { "bib", "tex" },
            callback = function()
                vim.wo.conceallevel = 2
            end,
        })

        vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
        vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
        vim.keymap.set('n', '<leader>ll', '<Cmd>VimtexCompile<CR>', { silent = true })
        vim.keymap.set('n', '<leader>lc', '<Cmd>VimtexClean<CR>', { silent = true })
        vim.keymap.set('n', '<leader>lv', '<Cmd>VimtexView<CR>', { silent = false })
    end,
}
