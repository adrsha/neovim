return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_ok then
      return
    end

    local sources = {
      null_ls.builtins.formatting.black.with({
        extra_args = { "--fast", "--line-length=120" }
      }),
    }

    null_ls.setup({ sources = sources })
  end
}
