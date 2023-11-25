return {
  { -- LSP
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("wacha.packer.configs.lsp")
    end,
    dependencies = {
      {   -- Language server installer
        "williamboman/mason.nvim",
        lazy = false,
        build = ":MasonUpdate",
        config = function()
          require("mason").setup()
        end,
      },
    }
  },
  { -- Syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      local opts = require("wacha.packer.configs.treesitter")
      config.setup(opts)
    end
  },
  { -- Completion
    "hrsh7th/nvim-cmp",
    config = function()
      require("wacha.packer.configs.cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
      },
    }
  },
  { -- Theme
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 999,
  },
}
