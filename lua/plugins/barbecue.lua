return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },

  config = function()
    -- triggers CursorHold event faster
    vim.opt.updatetime = 200

    require("barbecue").setup({
      create_autocmd = false, -- prevent barbecue from updating itself automatically
    })

    vim.api.nvim_create_autocmd({
      "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
      "BufWinEnter",
      "CursorHold",
      "InsertLeave",
    }, {
      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
      callback = function()
        require("barbecue.ui").update()
      end,
    })
    require("barbecue").setup({
      attach_navic = true,
      show_navic = true,
      create_autocmd = true,
      show_dirname = false,
      show_basename = true,
      show_modified = true,

      symbols = {
        ellipsis = "…",
        modified = "",
        separator = "〉",
      },

      modifiers = {
        dirname = ":~:.",
        basename = "",
      },

      theme = {
        -- this highlight is used to override other highlights
        -- you can take advantage of its `bg` and set a background throughout your winbar
        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
        normal = { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("ModeMsg")), "fg", "gui"), bold = true },
        -- these highlights correspond to symbols table from config
        --
        ellipsis = { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiagnosticHint")), "fg", "gui") },
        separator = { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiagnosticHint")), "fg", "gui") },
        modified = { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiagnosticHint")), "fg", "gui") },

        -- these highlights represent the _text_ of three main parts of barbecue
        dirname = { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DiagnosticHint")), "fg", "gui"), bold = true },
        basename = { bold = true },
        context = {},

        -- these highlights are used for context/navic icons
        context_file = { fg = "#ac8fe4" },
        context_module = { fg = "#ac8fe4" },
        context_namespace = { fg = "#ac8fe4" },
        context_package = { fg = "#ac8fe4" },
        context_class = { fg = "#ac8fe4" },
        context_method = { fg = "#FAE3B0" },
        context_property = { fg = "#FAE3B0" },
        context_field = { fg = "#ac8fe4" },
        context_constructor = { fg = "#DDB6F2" },
        context_enum = { fg = "#F8BD96" },
        context_interface = { fg = "#DDB6F2" },
        context_function = { fg = "#96CDFB" },
        context_variable = { fg = "#96CDFB" },
        context_constant = { fg = "#ABE9B3" },
        context_string = { fg = "#F8BD96" },
        context_number = { fg = "#F8BD96" },
        context_boolean = { fg = "#F8BD96" },
        context_array = { fg = "#F8BD96" },
        context_object = { fg = "#ac8fe4" },
        context_key = { fg = "#ABE9B3" },
        context_null = { fg = "#ac8fe4" },
        context_enum_member = { fg = "#ABE9B3" },
        context_struct = { fg = "#F8BD96" },
        context_event = { fg = "#ac8fe4" },
        context_operator = { fg = "#ac8fe4" },
        context_type_parameter = { fg = "#ac8fe4" },
      },
    })
  end,
}
