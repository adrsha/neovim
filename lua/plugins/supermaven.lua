return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-S-l>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-return>",
      },
      ignore_filetypes = { c = false },
      color = {
        suggestion_color = "#45475A",
        cterm = 244,
      },
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false            -- disables built in keymaps

    })
  end,
}
