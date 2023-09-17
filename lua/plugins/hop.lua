return {
  'phaazon/hop.nvim',
  config = function()
    vim.cmd [[
      highlight link HopNextKey @text.strong
      highlight link HopNextKey1 WarningMsg
      highlight link HopNextKey2 Normal
      highlight link HopUnmatched Whitespace
    ]]
    -- you can configure Hop the way you like here; see :h hop-config
    require 'hop'.setup { keys = 'asdfhjklzxcbewq' }
    -- place this in one of your configuration file(s)
    local hop = require('hop')
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'f', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set('', 'F', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set('', 't', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
    end, { remap = true })
    vim.keymap.set('', 'T', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
    end, { remap = true })
  end,

}
