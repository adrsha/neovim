return {
  'rcarriga/nvim-notify',
  opts = {
  },
  config = function()
    local notify = require("notify")
    vim.notify = notify
    print = function(...)
      local print_safe_args = {}
      local _ = { ... }
      for i = 1, #_ do
        table.insert(print_safe_args, tostring(_[i]))
      end
      notify(table.concat(print_safe_args, ' '), "info")
    end
    notify.setup({
      background_colour = "Normal",
      fps = 30,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 20,
      max_width = 70,
      render = "compact",
      stages = "static",
      timeout = 3000,
      top_down = false
    })
  end
}
