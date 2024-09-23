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
          rosewater = "#E69875",
          flamingo = "#876377",
          mauve = "#D699B6",
          pink = "#E67E80",
          red = "#E67E80",
          maroon = "#4C3743",
          peach = "#89707A",
          yellow = "#DBBC7F",
          green = "#A7C080",
          blue = "#7FBBB3",
          sky = "#628392",
          teal = "#83C092",
          lavender = "#C699C6",

          text = "#D3C6AA",
          subtext1 = "#9DA9A0",
          subtext0 = "#859289",
          overlay2 = "#7A8478",
          overlay1 = "#4F5B58",
          overlay0 = "#495156",
          surface2 = "#414B50",
          surface1 = "#374145",
          surface0 = "#2E383C",

          base = "#1E2326",
          mantle = "#272E33",
          crust = "#2E383C",
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
      TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

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
      TabLineFill = { bg = colors.mantle, fg = colors.text },
      TabLine = { bg = colors.mantle, fg = colors.text },
      DiagnosticHint = { fg = colors.green, bg = '#262d25' },
      DiagnosticWarn = { fg = colors.yellow, bg = '#453e29' },
      DiagnosticError = { fg = colors.red, bg = '#42232c' },
      DiagnosticInfo = { fg = colors.blue },
      DiagnosticLineNrHint = { fg = colors.green, bg = '#262d25' },
      DiagnosticLineNrWarn = { fg = colors.yellow, bg = '#453e29' },
      DiagnosticLineNrError = { fg = colors.red, bg = '#42232c' },
      DiagnosticLineNrInfo = { fg = colors.blue },
      DiagnosticUnderlineHint = { fg = colors.green, bg = '#262d25' },
      DiagnosticUnderlineWarn = { fg = colors.yellow, bg = '#453e29' },
      DiagnosticUnderlineError = { fg = colors.red, bg = '#42232c' },
      DiagnosticUnderlineInfo = { fg = colors.blue },
      LineNr = { fg = colors.overlay0 },
    }

    for hl, col in pairs(TelescopeColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    vim.cmd([[

    " highlight! DiagnosticLineNrError guibg=#B7435E guifg=#cc9b9d gui=bold
    " highlight! DiagnosticLineNrWarn guibg=#D88B72 guifg=#E8CCA7 gui=bold
    " highlight! DiagnosticLineNrInfo guibg=#6E7EBF guifg=#B8C9EA gui=bold
    " highlight! DiagnosticLineNrHint guibg=#414560 guifg=#63718B gui=bold

    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
    sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint

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
