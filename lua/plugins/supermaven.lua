return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-c>",
        accept_word = "<return>",
      },
      ignore_filetypes = { c = false },
      color = {
        suggestion_color = "#585B70",
        cterm = 244,
      },
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false            -- disables built in keymaps

    })
  end,
}
