return
{
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"      -- Optional, for persistent history
  },
  config = function()
    local hlgroups = require('cokeline.hlgroups')
    local hl_attr = hlgroups.get_hl_attr
    local colors = require("catppuccin.palettes").get_palette()

    require('cokeline').setup({

      fill_hl = 'WinSeparator',
      default_hl = {
        fg = function(buffer)
          return
              buffer.is_focused
              and colors.text
              or colors.overlay2
        end,
        bg = colors.mantle
      },

      components = {
        {
          text = ' ',
          bg = colors.base,
        },
        {
          text = '',
          bg = colors.base,
          fg = function(buffer)
            return
                buffer.is_focused
                and colors.mantle
                or colors.base
          end
        },
        {
          text = function(buffer)
            return buffer.devicon.icon
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
          bg = function(buffer)
            return
                buffer.is_focused
                and colors.mantle
                or colors.base
          end,
        },
        {
          text = ' ',
          bg = function(buffer)
            return
                buffer.is_focused
                and colors.mantle
                or colors.base
          end,
        },
        {
          text = function(buffer) return buffer.filename .. '  ' end,
          style = function(buffer)
            return buffer.is_focused and 'bold' or nil
          end,
          bg = function(buffer)
            return
                buffer.is_focused
                and colors.mantle
                or colors.base
          end,
        },
        {
          text = '❌',
          delete_buffer_on_left_click = true,
          bg = function(buffer)
            return
                buffer.is_focused
                and colors.mantle
                or colors.base
          end,
        },
        {
          text = '',
          fg = function(buffer)
            return
                buffer.is_focused
                and colors.mantle
                or colors.base
          end,
          bg = colors.base,
        },
      },
    })
    -- require('cokeline').setup({
    --   -- The highlight group used to fill the tabline space
    --   fill_hl = 'WinSeparator',
    --   default_hl = 'FloatNormal'
    -- })
  end
}
