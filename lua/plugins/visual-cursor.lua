return {
  'mcauley-penney/visual-whitespace.nvim',
  config = function()
    local colors = require("catppuccin.palettes").get_palette()
    require("visual-whitespace").setup({
      highlight = { fg = colors.overlay2, bg = colors.overlay1 },
      space_char = '·',
      tab_char = '→',
      nl_char = '↲',
      cr_char = '←'
    })
  end
}
