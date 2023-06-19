-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
      'NTBBloodbath/doom-one.nvim',
      setup = function()
          -- Add color to cursor
          vim.g.doom_one_cursor_coloring = false
          -- Set :terminal colors
          vim.g.doom_one_terminal_colors = true
          -- Enable italic comments
          vim.g.doom_one_italic_comments = false
          -- Enable TS support
          vim.g.doom_one_enable_treesitter = true
          -- Color whole diagnostic text or only underline
          vim.g.doom_one_diagnostics_text_color = false
          -- Enable transparent background
          vim.g.doom_one_transparent_background = false

          -- Pumblend transparency
          vim.g.doom_one_pumblend_enable = false
          vim.g.doom_one_pumblend_transparency = 20

          -- Plugins integration
          vim.g.doom_one_plugin_neorg = true
          vim.g.doom_one_plugin_barbar = false
          vim.g.doom_one_plugin_telescope = false
          vim.g.doom_one_plugin_neogit = true
          vim.g.doom_one_plugin_nvim_tree = true
          vim.g.doom_one_plugin_dashboard = true
          vim.g.doom_one_plugin_startify = true
          vim.g.doom_one_plugin_whichkey = true
          vim.g.doom_one_plugin_indent_blankline = true
          vim.g.doom_one_plugin_vim_illuminate = true
          vim.g.doom_one_plugin_lspsaga = false
      end,
      config = function()
          vim.cmd("colorscheme doom-one")
      end,
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('nvim-treesitter/playground')

  use('theprimeagen/harpoon')

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
  }
}

use {
    "NvChad/nvterm",
    config = function ()
        require("nvterm").setup()
    end,
}

use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
        require"startup".setup()
    end
}

 use('nvim-tree/nvim-tree.lua')

 use('nvim-tree/nvim-web-devicons')

 use {
     'nvim-lualine/lualine.nvim',
     requires = { 'nvim-tree/nvim-web-devicons', opt = true }
 }

 use('xiyaowong/transparent.nvim')

 use{
     'm4xshen/autoclose.nvim',
     config = function ()
         require("autoclose").setup({
             keys = {
                 ["\'"] = { close = false, escape = true},
             },
         })
     end
 }

end)
