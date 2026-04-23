return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    init = function()
        require 'nvim-treesitter'.setup {
            -- A list of parser names, or "all"
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "html", "typescript", "javascript", "python", "markdown", "markdown_inline", "latex" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")
            ignore_install = { "javascript" },

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            vim.api.nvim_create_autocmd('FileType', {
                callback = function(args)
                    local max_filesize = 100 * 1024
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
                    if ok and stats and stats.size > max_filesize then
                        return
                    end
                    pcall(vim.treesitter.start)
                end,
            })
        }
    end
}
