return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp",                lazy = true },
    { "hrsh7th/cmp-buffer",                  lazy = true },
    { "hrsh7th/cmp-path",                    lazy = true },
    { "hrsh7th/cmp-cmdline",                 lazy = true },
    { "hrsh7th/cmp-omni",                    lazy = true },
    { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
    { "saadparwaiz1/cmp_luasnip",            lazy = true },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      version = "v2.*",
      dependencies = {
        { "rafamadriz/friendly-snippets", lazy = true }
      },
      build = "make install_jsregexp",
    },
  },
  config = function()
    ---@diagnostic disable-next-line: different-requires
    local cmp = require("cmp")
    local completion_icons = require("wacha.settings").completion_icons

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
        docs_initially_visible = false,
      },
      formatting = {
        fields = { "kind", "abbr" },
        expandable_indicator = false,
        format = function(_, vim_item)
          vim_item.menu = vim_item.kind
          vim_item.kind = completion_icons[vim_item.kind]
          return vim_item
        end
      },

      window = {
        completion = cmp.config.window.bordered({
          winhighlight = 'FloatBorder:Normal,Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = 'FloatBorder:Normal,Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
        }),
        --border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│', },
        --cmp.config.window.bordered()
      },
      view = {
        docs = { auto_open = false }
      },
      mapping = cmp.mapping.preset.insert({
        ["<A-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 1 }),
        ["<A-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 1 }),
        ["<A-h>"] = cmp.mapping.scroll_docs(-4),
        ["<A-l>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-Space>"] = cmp.mapping(function()
          if not cmp.visible() then
            cmp.complete()
          elseif cmp.visible_docs() then
            cmp.close_docs()
          elseif not cmp.visible_docs() then
            cmp.open_docs()
          end
        end, { "i" }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp',               priority = 1000 },
        { name = "nvim_lsp_signature_help" },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip',                priority = 500 }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer', priority = 250 },
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    -- Set up lspconfig.
    local lspconfig = require('lspconfig')
    local lspservers = require("wacha.settings").lspservers
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    for name, _ in pairs(lspservers) do
      lspconfig[name].setup({
        capabilities = capabilities
      })
    end
  end
}
