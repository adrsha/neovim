return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-lua/plenary.nvim',
    'SalOrak/whaler.nvim',
  },
  config = function()
    local actions = require "telescope.actions"
    require('telescope').setup {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        -- Default configuration for telescope goes here:
        -- config_key = value,
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
        border = true,
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        layout_strategy = "horizontal",

        borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', },
        mappings = {
          n = {
            ["<esc>"] = actions.close,
            ["q"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["<C-l>"] = actions.select_default,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["M"] = actions.move_to_middle,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result

            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-l>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<M-f>"] = actions.results_scrolling_left,
            ["<M-b>"] = actions.results_scrolling_right,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-/>"] = actions.which_key,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            ["<C-w>"] = { "<c-s-w>", type = "command" },
          }
        }
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        whaler = {
          directories = { "/home/chilly/Codes/" },            -- Path directories to search. By default the list is empty.
          oneoff_directories = { "/home/user/.config/nvim" }, -- Path directories to append directly to list of projects. By default is empty.
          auto_file_explorer = true,                          -- Whether to automatically open file explorer. By default is `true`
          auto_cwd = true,                                    -- Whether to automatically change current working directory. By default is `true`
          file_explorer_config = {
            plugin_name = "telescope",
            command = "Telescope find_files",
            prefix_dir = " cwd=",
          },
          theme = {                -- Telescope theme default Whaler options.
            results_title = false, -- Either `false` or a string.
            layout_strategy = "center",
            previewer = false,
            layout_config = {
              height = 0.3,
              width = 0.4
            },
            sorting_strategy = "ascending",
            border = true,
          }
        },

        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        },
      },
    }
    require("telescope").load_extension("ui-select")
    local telescope = require('telescope')
    vim.keymap.set("n", "<leader>ww", telescope.extensions.whaler.whaler)
  end
}
