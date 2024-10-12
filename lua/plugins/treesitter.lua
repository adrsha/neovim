return {
  -- Highlight, edit, and navigate code
  event = {
    'VeryLazy'
  },
  build = ":TSUpdate",
  'nvim-treesitter/nvim-treesitter',

  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      event = "VeryLazy",
      dependency = {
        'nvim-treesitter/nvim-treesitter',
      }
    },
    {
      "David-Kunz/treesitter-unit",
      -- event = "Verylazy",
      dependency = {
        'nvim-treesitter/nvim-treesitter',
      }
    },
    {
      'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
      -- event = "VeryLazy",
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

    require 'treesitter-context'.setup {
      enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'topline',         -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = "━",
      zindex = 21,     -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }

    require("nvim-treesitter.configs").setup {

      ensure_installed = { "c", "javascript" },
      auto_install = true,
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
        navigation = {
          enable = true,
          keymaps = {
            goto_next_usage = "<a-n>",
            goto_previous_usage = "<a-S-n>",
          },
        },

      },
      -- REFACTOR END
    }
  end
}
