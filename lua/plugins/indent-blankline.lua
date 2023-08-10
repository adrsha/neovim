vim.cmd [[
let g:indent_blankline_char = '┊'
highlight IndentBlanklineSpaceChar guifg=#1E1E2E gui=nocombine
highlight IndentBlanklineSpaceCharBlankline guifg=#1E1E2E gui=nocombine
highlight IndentBlanklineChar guifg=#1E1E2E gui=nocombine
highlight IndentBlanklineContextChar guifg=#1E1E2E gui=nocombine
highlight IndentBlanklineContextSpaceChar gui=nocombine
]]

return { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  opts = {
    char = '┊',
    show_trailing_blankline_indent = false,
    show_current_context = true,
  },
}
