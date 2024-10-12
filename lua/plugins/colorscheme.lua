return {
  "catppuccin/nvim",

  name = "catppuccin",
  priority = 1000,
  event = 'VimEnter',
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = true, -- Force no italic
      no_bold = false,  -- Force no bold
      styles = {
        comments = {},
        conditionals = { "bold" },
        loops = { "bold" },
        functions = { "bold" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          rosewater = "#F5D0DC",
          flamingo = "#F4B9B0",
          mauve = "#EF7E7E",
          pink = "#F6C7D8",
          red = "#EF7E7E",
          maroon = "#e57474",
          peach = "#F6C4A6",
          yellow = "#e5c76b",
          green = "#8ccf7e",
          blue = "#6cb2bf",
          sky = "#A3C9E0",
          teal = "#6cbfbf",
          lavender = "#6cbfbf",

          text = "#DADADA",
          subtext1 = "#b3b9b8",
          subtext0 = "#DADADA",
          overlay2 = "#333a3d",
          overlay1 = "#232a2d",
          overlay0 = "#232a2d",
          surface2 = "#232a2d",
          surface1 = "#232a2d",
          surface0 = "#232a2d",

          base = "#141b1e",
          mantle = "#101718",
          crust = "#232a2d",
        }
      },
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })
    vim.cmd.colorscheme "catppuccin"
    local colors = require("catppuccin.palettes").get_palette()
    local TelescopeColor = {
      TelescopeMatching = { fg = colors.flamingo },
      TelescopeSelection = { bg = colors.surface0, bold = true },

      WinSeparator = { bg = colors.base, fg = colors.base },
      TelescopePromptPrefix = { bg = colors.mantle },
      TelescopePromptNormal = { bg = colors.mantle },
      TelescopeResultsNormal = { bg = colors.mantle },
      TelescopePreviewNormal = { bg = colors.mantle },
      TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
      FloatTitle = { bg = colors.mauve, fg = colors.mantle },
      TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
      TelescopeResultsTitle = { fg = colors.mantle },
      TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
      NormalFloat = { bg = colors.mantle, fg = colors.text },
      FloatBorder = { bg = colors.mantle, fg = colors.mantle },
      BufferTabpageFill = { bg = colors.mantle, fg = colors.text },
      BufferLineBackground = { bg = colors.base, fg = colors.text },
      BufferLineBuffer = { bg = colors.base, fg = colors.text },
      TabLineFill = { bg = colors.mantle, fg = colors.text },
      TabLine = { bg = colors.mantle, fg = colors.text },
      LspDiagnosticHint = { fg = colors.green, bg = '#262d25' },
      LspDiagnosticWarn = { fg = colors.yellow, bg = '#453e29' },
      LspDiagnosticError = { fg = colors.red, bg = '#42232c' },
      LspDiagnosticInfo = { fg = colors.blue },
      DiagnosticHint = { fg = colors.green, bg = '#262d25' },
      DiagnosticWarn = { fg = colors.yellow, bg = '#453e29' },
      DiagnosticError = { fg = colors.red, bg = '#42232c' },
      DiagnosticInfo = { fg = colors.blue },
      DiagnosticLineHint = { fg = colors.green, bg = NONE },
      DiagnosticLineWarn = { fg = colors.yellow, bg = NONE },
      DiagnosticLineError = { fg = colors.red, bg = NONE },
      DiagnosticLineInfo = { fg = colors.blue },
      DiagnosticVirtualTextHint = { fg = colors.green, bg = '#262d25' },
      DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = '#453e29' },
      DiagnosticVirtualTextError = { fg = colors.red, bg = '#42232c' },
      DiagnosticVirtualTextInfo = { fg = colors.blue },
      DiagnosticUnderlineHint = { bg = '#262d25' },
      DiagnosticUnderlineWarn = { bg = '#453e29' },
      DiagnosticUnderlineError = { bg = '#42232c' },
      DiagnosticUnderlineInfo = { bg = '#252031' },
      LineNr = { fg = colors.overlay0 },
      TreeSitterContext = { fg = colors.overlay0, bg = colors.base },
      TreeSitterContextSeparator = { fg = colors.green, bg = colors.base },
    }

    for hl, col in pairs(TelescopeColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    vim.cmd([[

    " highlight! DiagnosticLineNrError guibg=#B7435E guifg=#cc9b9d gui=bold
    " highlight! DiagnosticLineNrWarn guibg=#D88B72 guifg=#E8CCA7 gui=bold
    " highlight! DiagnosticLineNrInfo guibg=#6E7EBF guifg=#B8C9EA gui=bold
    " highlight! DiagnosticLineNrHint guibg=#414560 guifg=#63718B gui=bold

    " sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    " sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    " sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
    " sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint

    " highlight! CursorColumn guibg=#242933
    " highlight! link TelescopeBorder CursorColumn
    " highlight! link TelescopeNormal CursorColumn
    " highlight! link TelescopeTitle Title

    highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080

    highlight! CmpItemAbbrMatch guibg=NONE guifg=#CCCBD9
    highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch

    highlight! CmpItemKindVariable guibg=NONE guifg=#95C2D1
    highlight! link CmpItemKindInterface CmpItemKindVariable
    highlight! link CmpItemKindText CmpItemKindVariable

    highlight! CmpItemKindFunction guibg=NONE guifg=#f6bbe7
    highlight! link CmpItemKindMethod CmpItemKindFunction

    highlight! CmpItemKindKeyword guibg=NONE guifg=#caf6bb
    highlight! link CmpItemKindProperty CmpItemKindKeyword
    highlight! link CmpItemKindUnit CmpItemKindKeyword

    highlight NotifyERRORBorder guifg=#F28FAD
    highlight NotifyWARNBorder guifg=#FAE3B0
    highlight NotifyINFOBorder guifg=#ABE9B3
    highlight NotifyDEBUGBorder guifg=#575268
    highlight NotifyTRACEBorder guifg=#988BA2

    highlight NotifyERRORIcon guifg=#F5C2E7
    highlight NotifyWARNIcon guifg=#F8BD96
    highlight NotifyINFOIcon guifg=#ABE9B3
    highlight NotifyDEBUGIcon guifg=#6E6C7E
    highlight NotifyTRACEIcon guifg=#DDB6F2
    highlight NotifyERRORTitle  guifg=#F5C2E7
    highlight NotifyWARNTitle guifg=#F8BD96
    highlight NotifyINFOTitle guifg=#ABE9B3
    highlight NotifyDEBUGTitle  guifg=#6E6C7E
    highlight NotifyTRACETitle  guifg=#DDB6F2
    highlight link NotifyERRORBody Normal
    highlight link NotifyWARNBody Normal
    highlight link NotifyINFOBody Normal
    highlight link NotifyDEBUGBody Normal
    highlight link NotifyTRACEBody Normal

    highlight TSRainbowOrange  guifg=#F8BD96 ctermfg=White
    highlight TSRainbowRed  guifg=#F28FAD ctermfg=White
    highlight TSRainbowYellow  guifg=#FAE3B0 ctermfg=White
    highlight TSRainbowBlue  guifg=#96CDFB ctermfg=White
    highlight TSRainbowGreen  guifg=#988BA2 ctermfg=White
    highlight TSRainbowViolet  guifg=#DDB6F2 ctermfg=White
    highlight TSRainbowCyan  guifg=#89DCEB ctermfg=White
    ]])
  end
}
