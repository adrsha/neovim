return ({
  "ghillb/cybu.nvim",
  branch = "main", -- timely updates
  keys = {
    '<Tab>',
    '<S-Tab>',
  },
  -- branch = "v1.x", -- won't receive breaking changes
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }, -- optional for icon support
  config = function()
    local ok, cybu = pcall(require, "cybu")
    if not ok then
      return
    end
    require("cybu").setup({
      position = {
        relative_to = "editor", -- win, editor, cursor
        anchor = "bottomright", -- topleft, topcenter, topright,
        -- centerleft, center, centerright,
        -- bottomleft, bottomcenter, bottomright
        vertical_offset = 0,   -- vertical offset from anchor in lines
        horizontal_offset = 0, -- vertical offset from anchor in columns
        max_win_height = 9,    -- height of cybu window in lines
        max_win_width = 0.5,   -- integer for absolute in columns
        -- float for relative to win/editor width
      },
      style = {
        path = "relative", -- absolute, relative, tail (filename only)
        path_abbreviation = "none", -- none, shortened
        border = "none", -- single, double, rounded, none
        separator = "  ", -- string used as separator
        prefix = "…", -- string used as prefix for truncated paths
        padding = 1, -- left & right padding in number of spaces
        hide_buffer_id = true, -- hide buffer IDs in window
        devicons = {
          enabled = true, -- enable or disable web dev icons
          colored = true, -- enable color for web dev icons
          truncate = true, -- truncate wide icons to one char width
        },
        highlights = { -- see highlights via :highlight
          current_buffer = "PMenuSel", -- current / selected buffer
          adjacent_buffers = "CybuAdjacent", -- buffers not in focus
          background = "CybuBackground", -- window background
          border = "CybuBorder", -- border of the window
        },
      },
      behavior = { -- set behavior for different modes
        mode = {
          default = {
            switch = "immediate", -- immediate, on_close
            view = "paging",      -- paging, rolling
          },
          last_used = {
            switch = "immediate", -- immediate, on_close
            view = "paging",      -- paging, rolling
          },
          auto = {
            view = "paging", -- paging, rolling
          },
        },
        show_on_autocmd = "BufEnter", -- event to trigger cybu (eg. "BufEnter")
      },
      display_time = 700,             -- time the cybu window is displayed
      exclude = {                     -- filetypes, cybu will not be active
        "neo-tree",
        "fugitive",
        "qf",
      },
      filter = {
        unlisted = true, -- filter & fallback for unlisted buffers
      },
      -- fallback = function() end, -- arbitrary fallback function
      -- used in excluded filetypes
    })

    vim.keymap.set("n", "<S-Tab>", "<Plug>(CybuPrev)")
    vim.keymap.set("n", "<Tab>", "<Plug>(CybuNext)")
  end,
})
