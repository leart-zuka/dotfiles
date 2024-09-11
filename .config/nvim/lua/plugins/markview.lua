return {
    "OXY2DEV/markview.nvim",
    lazy = false,    -- Recommended
    ft = "markdown", -- If you decide to lazy-load anyway

    dependencies = {
        "nvim-treesitter/nvim-treesitter",

        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("markview").setup({
            highlight_groups = {
                {
                    group_name = "Heading1",
                    value = { fg = "#1e1e2e", bg = "#91A3E3" }
                },
                {
                    group_name = "Heading1Corner",
                    value = { fg = "#91A3E3" }
                },
            },
            headings = {
                enable = true,
                shift_width = 0,

                -- heading_1 = {
                --     style = "label",
                --
                --     padding_left = " ",
                --     padding_right = " ",
                --
                --     corner_right = "",
                --     corner_right_hl = "Heading1Corner",
                --
                --     hl = "Heading1"
                -- }
            },
            Checkboxes = {
                enable = true,

                checked = {
                    text = "✔", hl = "TabLineSel"
                },
                unchecked = {},
                pending = {},
                custom = {
                    {
                        match = "~",
                        text = "◕",
                        hl = "CheckboxProgress"
                    }
                }
            },
            code_blocks = {
                style = "minimal",
                icons = true,
                position = nil,
                min_width = 70,

                pad_amount = 3,
                pad_char = " ",

                language_direction = "left",
                language_names = { "python" },

                hl = "CursorLine",

                sign = true,
                sign_hl = nil
            }

        });

        vim.cmd("Markview enableAll");
    end
}
