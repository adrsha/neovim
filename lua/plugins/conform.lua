return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      -- Conform will run multiple formatters sequentially
      -- Use a sub-list to run only the first available formatter

      python = { "black" },
      javascript = { { "prettierd" } },
      javascriptreact = { { "prettierd" } },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
