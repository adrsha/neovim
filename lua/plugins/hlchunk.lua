return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        notify = false,
        use_treesitter = false,
        -- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
        -- support_filetypes = ft.support_filetypes,
        -- exclude_filetypes = ft.exclude_filetypes,
        chars = {
          -- horizontal_line = "━",
          -- vertical_line = "│",
          -- left_top = "╒",
          -- left_bottom = "╘",
          -- right_arrow = "━",
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "┌",
          left_bottom = "└",
          right_arrow = "─",
          --
          -- horizontal_line = "━",
          -- vertical_line = "┃",
          -- left_top = "┏",
          -- left_bottom = "┗",
          -- right_arrow = "",
        },
        style = {
          { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Array")), "fg", "gui") },
          { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Error")), "fg", "gui") },
        },
        textobject = " ",
        max_file_size = 1024 * 1024,
        error_sign = false,
      },

      indent = {
        enable = true,
        use_treesitter = false,
        chars = {
          "│",
        },
        style = {
          { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("ColorColumn")), "bg", "gui") }
        },
      },

      line_num = {
        enable = true,
        use_treesitter = false,
        style = { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("WildMenu")), "bg", "gui") },
      },

      blank = {
        enable = false,
        chars = {
          "․",
        },
        style = {
          vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("ColorColumn")), "fg", "gui"),
        },
      },
    })
  end
}
