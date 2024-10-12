return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup {
      input_buffer_type = "dressing",
    }
    vim.keymap.set("n", "<leader>rr", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true })
  end,
}
