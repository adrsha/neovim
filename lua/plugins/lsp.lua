return {
  'neovim/nvim-lspconfig',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "{", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "}", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Open LSP signatures"
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local newopts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'single',
            source = 'always',
            prefix = ' ',
            -- scope = 'cursor',
          }
          vim.diagnostic.open_float(nil, newopts)
        end
      })
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = true
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure python server
    -- lspconfig["pylsp"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   settings = {
    --     pylsp = {
    --       plugins = {
    --         pycodestyle = {
    --           maxLineLength = 200,
    --         },
    --         flake8 = {
    --           maxLineLength = 200,
    --           -- maxComplexity = 400,
    --         },
    --         mccabe = {
    --           threshold = 400,
    --         }
    --       }
    --     }
    --   }
    -- })

    -- configure cpp server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true
          }
        }
      }
    })
    -- configure cpp server
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure js server
    lspconfig["denols"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["bashls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        -- Use a sharp border with `FloatBorder` highlights
        border = "single",
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        -- Use a sharp border with `FloatBorder` highlights
        border = "single",
      }
    )

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable signs
        border = "single",
        signs = true,
      }
    )
    local signs = { Error = "󰡚 ", Warn = "󰡛 ", Hint = "󰡜 ", Info = "󰡙 " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl, icon = '' })
    end

    vim.diagnostic.config({
      virtual_text = false,
      -- virtual_text = {
      --   spacing = 2,
      --   source = "always", -- Or "if_many"
      --   prefix = ' ',
      -- },
      float = {
        source = 'always',
        border = 'single'
      },
      -- virtual_lines = { only_current_line = true, highlight_whole_line = false },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
    -- You will likely want to reduce updatetime which affects CursorHold
    -- note: this setting is global and should be set only once
    -- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
  end,
}
