return {
  -- Highlight, edit, and navigate code
  event = {
    'VeryLazy'
  },
  build = ":TSUpdate",
  'nvim-treesitter/nvim-treesitter',

  dependencies = {
    {
      "David-Kunz/treesitter-unit",
      event = "VeryLazy",
      dependency = {
        'nvim-treesitter/nvim-treesitter',
      }
    },
    {
      'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
      event = "VeryLazy",
      dependency = {
        'nvim-treesitter/nvim-treesitter',
      }
    },
    {
      "windwp/nvim-ts-autotag",
      dependency = {
        'nvim-treesitter/nvim-treesitter',
      }
    },
    {
      'nvim-treesitter/nvim-treesitter-refactor',
      dependency = {
        'nvim-treesitter/nvim-treesitter',
      }
    },
  },


  config = function()
    -- This module contains a number of default definitions
    local rainbow_delimiters = require 'rainbow-delimiters'

    ---@type rainbow_delimiters.config
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
      },
      query = {
        [''] = 'rainbow-delimiters',
      },
      priority = {
        [''] = 110,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
      blacklist = { 'html' },
    }

    require("nvim-treesitter.configs").setup {

      ensure_installed = { "c", "javascript" },
      auto_install = false,
      sync_install = true,
      ignore_install = { "lua" },

      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },


      -- REFACTOR START
      refactor = {
        highlight_definitions = {
          enable = true,
          clear_on_cursor_move = true,
        },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "<space>rr",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            -- goto_definition = "gnd",
            -- list_definitions = "gnD",
            list_definitions_toc = "gld",
            goto_next_usage = "<a-n>",
            goto_previous_usage = "<a-S-n>",
          },
        },

      },
      -- REFACTOR END
    }
  end
}
