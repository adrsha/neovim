return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'RRethy/nvim-treesitter-textsubjects',
      'RRethy/nvim-treesitter-endwise',
      'mrjones2014/nvim-ts-rainbow',
    },
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
         rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
            -- 
          },
          endwise = {
                  enable = true,
          },
          textsubjects = {
            enable = true,
            prev_selection = ',', -- (Optional) keymap to select the previous selection
            keymaps = {
                ['.'] = 'textsubjects-smart',
                [';'] = 'textsubjects-container-outer',
                ['i;'] = 'textsubjects-container-inner',
            },
          }
        }
    end
  }
