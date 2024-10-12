return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    inlay_hints = { enabled = true },
  },
  config = function()
    -- Setup language servers.
    local lspconfig = require("lspconfig")

    local configs = require("lspconfig/configs")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.pyright.setup({
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
          },
        },
      },
      single_file_support = true,
    })

    lspconfig.dartls.setup({
      capabilities = capabilities,
      -- on_attach = on_attach
    })

    lspconfig.clangd.setup({
      capabilities = capabilities,
      -- on_attach = on_attach
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      -- on_attach = on_attach
    })

    lspconfig.rust_analyzer.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,

      diagnostics = {
        enable = true,
      },
    })

    lspconfig.tsserver.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.html.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,
      {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
          css = true,
          javascript = true,
        },
        provideFormatter = true,
      },
    })
    lspconfig.cssls.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        css = {
          validate = true,
        },
        scss = {
          validate = true,
        },
      },
    })

    lspconfig.emmet_ls.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "css", "eruby", "html", "less", "sass", "scss", "svelte", "pug", "vue" },
      init_options = {
        html = {
          options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            ["bem.enabled"] = true,
          },
        },
      },
    })
    -- vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    -- vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    -- vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    -- vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
    vim.diagnostic.config({
      virtual_text = false,
      signs = false,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    })

    -- vim.api.nvim_create_autocmd("CursorHold", {
    -- 	callback = function()
    -- 		local opts = {
    -- 			focusable = false,
    -- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    -- 			border = "single",
    -- 			source = "always",
    -- 			prefix = " ",
    -- 			scope = "cursor",
    -- 		}
    -- 		vim.diagnostic.open_float(nil, opts)
    -- 	end,
    -- })
  end,
}
