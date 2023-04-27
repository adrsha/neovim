return {
  'AckslD/nvim-trevJ.lua',

  -- an example for configuring a keybind, can also be done by filetype
  config = function()
    vim.keymap.set('n', '<leader>j', function()
      require('trevj').format_at_cursor()
    end)
  end,
}
