return {
  "nvim-neorg/neorg",
  lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
            icons = {

              delimiter = {
                horizontal_line = {
                  highlight = "TelescopePromptNormal",
                },
              },
              code_block = {
                -- If true will only dim the content of the code block (without the
                -- `@code` and `@end` lines), not the entirety of the code block itself.
                highlight = "TelescopePromptNormal",
                content_only = true,
                conceal = true,
                padding = {
                  left = 5,
                  right = 0,
                }

              },
            },
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = vim.env.HOME .. "/Notes",
            },
            default_workspace = "notes",
          },
        },
      }
    })
  end,
}
