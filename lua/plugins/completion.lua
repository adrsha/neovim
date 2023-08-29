return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    {
      'hrsh7th/cmp-nvim-lsp',
      dependencies = { 'L3MON4D3/LuaSnip' }
    },
    -- 'chrisgrieser/cmp-nerdfont',
    'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer' },
  config = function()
    local kind_icons = {
      Text = "",
      Method = "m",
      Function = "𝛏",
      Constructor = "",
      Field = "",
      Variable = "Φ",
      Class = "∐ ",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "¾",
      Enum = "",
      Keyword = " ",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "π",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "()",
    }
    -- Set up nvim-cmp.
    local ELLIPSIS_CHAR = '…'
    local MAX_LABEL_WIDTH = 20
    local MIN_LABEL_WIDTH = 20
    local cmp = require 'cmp'
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },

      window = {
        completion = cmp.config.window.bordered({
          border = 'single',
        }),
        documentation = cmp.config.window.bordered({
          border = 'single',
        }),
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),

      }),
      -- To select the first candidate on enter
      -- cmp.mapping.confirm({ select = true }),

      -- To select the first candidate always
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },



      sources = cmp.config.sources({ -- The sequence in which these are mentioned determines their priority
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nerdfont' },
        -- { name = 'cmp_tabnine' },
        -- { name = 'vsnip' },     -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'buffer' },
        { name = 'path' },
      }),


      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            nvim_lsp = " ",
            buffer = " ",
            nerdfont = " ",
            -- cmp_tabnine = " ",
            luasnip = " ",
            path = "",
          })[entry.source.name]

          local label = vim_item.abbr
          local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
          if truncated_label ~= label then
            vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
          elseif string.len(label) < MIN_LABEL_WIDTH then
            local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
            vim_item.abbr = label .. padding
          end
          return vim_item
        end,
      },

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' },
        })
      }),
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
    })
  end
}
