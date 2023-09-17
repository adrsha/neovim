return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    'cohama/lexima.vim',
    event = 'InsertEnter',
  },
  {
    "wellle/targets.vim",
    event = 'CursorMoved',
  },
  {
    'RRethy/nvim-treesitter-textsubjects',

    dependency = {
      'nvim-treesitter/nvim-treesitter',
    }
  },
  {
    'HiPhish/nvim-ts-rainbow2',
    event = "VeryLazy",
    dependency = {
      'nvim-treesitter/nvim-treesitter',
    }
  },
  {
    "windwp/nvim-ts-autotag",
    dependency = {
      'nvim-treesitter/nvim-treesitter',
    }
  },
  {
    'nvim-treesitter/nvim-treesitter-refactor',
    dependency = {
      'nvim-treesitter/nvim-treesitter',
    }
  },
  -- Useful status updates for LSP
}
