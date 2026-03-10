return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.

        vim.g.vimtex_quickfix_ignore_filters = {
            "Warning",
            "Package.*Warning",
            "Missing character",
            "Underfull",
            "Overfull",
            "LaTeX Warning",
        }

        vim.g.vimtex_quickfix_mode = 1
        vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-lualatex -shell-escape" }
        vim.g.vimtex_indent_on_ampersands = 0
        vim.g.matchup_override_vimtex = 1
        vim.g.vimtex_complete_enabled = 1
        vim.g.vimtex_view_method = "zathura"
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
        vim.keymap.set('n', '<leader>lt', '<Cmd>VimtexTocToggle<CR>', { silent = false })
    end,
}
