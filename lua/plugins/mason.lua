return {
  -- Mason
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
        ensure_installed = {
          -- "html",
          -- "cssls",
          -- "lua_ls",
          -- "ruff-lsp",
          -- "clangd",
        },
        automatic_installation = true,
      })
    end,
  },
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  opts = {
    PATH = "prepend",
    ui = {
      border = "single",
      icons = {
        package_pending = "󰘻 ",
        package_installed = "󰘽 ",
        package_uninstalled = "󰬸 ",
      },

      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "x",
        cancel_installation = "<C-c>",
      },
    },

    max_concurrent_installers = 10,
  },
  config = function(_, opts)
    require("mason").setup(opts)
  end,
}
