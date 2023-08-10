return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'RRethy/nvim-treesitter-endwise',
    'David-Kunz/treesitter-unit',
    'HiPhish/nvim-ts-rainbow2',
  },
  build = ":TSUpdate",
  config = function()
    local vim = vim
    local opt = vim.opt

    opt.foldmethod = "expr"
    opt.foldexpr = "nvim_treesitter#foldexpr()"
    require "treesitter-unit".toggle_highlighting(higroup)
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "lua", "vim", "vimdoc", "query" },
      auto_install = true,
      sync_install = true,
      highlight = {
        enable = true,
        -- disable = { "c", "rust" },
      },
      indent = { enable = true },
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        -- Which query to use for finding delimiters
        query = 'rainbow-parens',
        -- Highlight the entire buffer all at once
        strategy = require('ts-rainbow').strategy.global,
      },
      endwise = {
        enable = true,
      },
    }
  end
}
