return
{
  'codota/tabnine-nvim',
  build = "./dl_binaries.sh",
  config = function()
    require('tabnine').setup({
      disable_auto_comment = false,
      accept_keymap = "<C-l>",
      dismiss_keymap = "<C-]>",
      debounce_ms = 400,
      suggestion_color = { gui = "#717482", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt" },
      log_file_path = nil, -- absolute path to Tabnine log file
    })
  end
}
