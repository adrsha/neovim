return {
  'shellRaining/hlchunk.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local colors = require("catppuccin.palettes").get_palette()
    require('hlchunk').setup({
      chunk = {
        enable = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "",
        },
        notify = false,
        priority = 0,
        style = colors.surface0,
      },
      indent = {
        enable = false,
        notify = false,
        priority = 0,
        style = colors.surface0,
        use_treesitter = false,
        chars = { "╎" },
        -- ┃│╏┊︴╷╵╎〡︱
        ahead_lines = 5,
        delay = 100,
      }
    })
  end
}
