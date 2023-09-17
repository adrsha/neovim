return {
  'nvimdev/dashboard-nvim',
  config = function()
    local dashboard = require("dashboard")

    local time = os.date("%H:%M")
    local v = vim.version()
    local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

    dashboard.setup({
      theme = "doom",
      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },
      config = {
        header = {
          "                                                  ",
          "                                                  ",
          "                                                  ",
          "                                                  ",
          "         ▄▄                             ▄▓▓       ",
          "          ▀▓▓▓                        ▓▓▓         ",
          "       ▀▓▄   ▓▓▓                     ▓▓  ▓▓       ",
          "         ▓▓▓▓▄ ▓                    ▐▓ ▄▓▓        ",
          "       ▐   ▓▓▓▓     ▄▄▄  ▄▄▄▄        ▀ ▐▓▓▓▌       ",
          "        ▓▓▄▓▓▓▓▓     ▀▓▓▓▓▓▓▓▀        ▓▓▓▓▌       ",
          "         ▀▓▓▓▓▓▓▓       ▓▓▓▓         ▓▓▓▓▓  ▄▓    ",
          "            ▐▓▓▓▓▓▄    ▄▓▓▓▓▄      ▄▓▓▓▓▓▓▓▓▓     ",
          "           ▀▓▀▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀▀        ",
          "              ▄▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▄▄▄       ",
          "            ▀▓▓▓▀ ▓▓▓ ▓▓▓▓▓▓▓▓▌ ▓▓▓▓▓ ▀▓▓▀        ",
          "                  ▀    ▓▓▓▓▓▓     ▓▓▓▄            ",
          "                        ▄ ▓▓▓                     ",
          "                     ▄▓ ▓▓▄▐▓                     ",
          "                    ▐▓▓ ▓▓▓                       ",
          "                    ▐▓  ▓▓▓▓                      ",
          "                         ▓▓▓                      ",
          "                            ▀                     ",
        },
        center = {
          {
            icon = "󰱼  ",
            icon_hl = "GitSignsAdd",
            desc = "Resume Last Session",
            desc_hl = "@method",
            key = "r",
            key_hl = "@text.strong",
            action = "SessionManager load_last_session",
          },
          {
            icon = "󰱼  ",
            icon_hl = "GitSignsAdd",
            desc = "Browser",
            desc_hl = "@method",
            key = "f",
            key_hl = "@text.strong",
            action = "lua MiniFiles.open()",
          },
          {
            icon = "󰗼  ",
            icon_hl = "GitSignsAdd",
            desc = "Quit",
            desc_hl = "@method",
            key = "q",
            key_hl = "@text.strong",
            action = "qa",
          },
        },
        footer = {
          " " .. time .. " ",
          version,
        },
      },
    })

    vim.cmd [[
    highlight link AlphaHeader Error
    highlight link AlphaHeader Error
    ]]
  end
}
