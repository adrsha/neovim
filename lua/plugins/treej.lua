return {
  'Wansmer/treesj',
  keys = {
    '<space>t',
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup({})
    -- For use default preset and it work with dot
    vim.keymap.set('n', '<leader>z', require('treesj').toggle)
    -- For extending default preset with `recursive = true`, but this doesn't work with dot
  end,
}
