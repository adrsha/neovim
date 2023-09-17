return {
  "folke/drop.nvim",
  event = "VimEnter",
  config = function()
    require("drop").setup({
      theme = "snow",                                  -- can be one of rhe default themes, or a custom theme
      max = 40,                                        -- maximum number of drops on the screen
      interval = 100,                                  -- every 150ms we update the drops
      screensaver = false,
      filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
    })
  end,
}
