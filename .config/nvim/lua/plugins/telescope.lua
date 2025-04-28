return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        init = function()
            require('telescope').setup {
                defaults = {
                    -- ...
                },
                pickers = {
                    find_files = {
                        theme = "ivy",
                    }
                },
                extensions = {
                    -- ...
                }
            }
        end,
        config = function()
            local builtin = require('telescope.builtin')
            -- Files
            vim.keymap.set('n', '<leader>pp', builtin.find_files, {})
            vim.keymap.set('n', '<leader>pw', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})

            -- Git
            vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
            vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
            vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').setup {
                extensions = {
                    file_browser = {
                        hidden = { file_browser = true },
                    }
                }
            }
            vim.keymap.set('n', '<leader><leader>', "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", {})
        end
    },
    {
        "debugloop/telescope-undo.nvim",
        dependencies = { -- note how they're inverted to above example
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        keys = {
            { -- lazy style key map
                "<leader>u",
                "<cmd>Telescope undo<cr>",
                desc = "undo history",
            },
        },
        opts = {
            -- don't use `defaults = { }` here, do this in the main telescope spec
            extensions = {
                undo = {
                    -- telescope-undo.nvim config, see below
                },
                -- no other extensions here, they can have their own spec too
            },
        },
        config = function(_, opts)
            -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
            -- configs for us. We won't use data, as everything is in it's own namespace (telescope
            -- defaults, as well as each extension).
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    }
}
