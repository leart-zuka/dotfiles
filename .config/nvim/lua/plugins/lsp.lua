return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        ---------------------------------------------------------------
        -- Completion (replaces lsp-zero's 'recommended' preset)
        ---------------------------------------------------------------
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args) luasnip.lsp_expand(args.body) end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources(
                { { name = "nvim_lsp" }, { name = "luasnip" } },
                { { name = "buffer" }, { name = "path" } }
            ),
        })

        ---------------------------------------------------------------
        -- Settings shared by every server
        ---------------------------------------------------------------
        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        -- Servers to start. Each binary must be on PATH (installed via Nix).
        vim.lsp.enable({
            "pyright", -- Python types/navigation
            "ruff",    -- Python linting/formatting
            "ts_ls",   -- TypeScript/JavaScript
            "eslint",
            "rust_analyzer",
            "lua_ls", -- Lua (your nvim config)
            "nixd",   -- Nix (your dotfiles)
            "clangd",
        })

        vim.diagnostic.config({ virtual_text = true })

        ---------------------------------------------------------------
        -- Keymaps, set whenever a server attaches to a buffer
        ---------------------------------------------------------------
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local opts = { buffer = ev.buf, remap = false }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
                vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
            end,
        })
    end,
}
