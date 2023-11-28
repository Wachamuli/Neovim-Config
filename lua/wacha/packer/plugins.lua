return {
  { 'nvim-tree/nvim-web-devicons' },
  { -- LSP
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("wacha.packer.configs.lsp")
    end,
    dependencies = {
      { -- Language server installer
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
  { -- GIT integration
    "lewis6991/gitsigns.nvim",
    config = function()
      local options = require("wacha.packer.configs.gitsigns")
      require("gitsigns").setup(options)
    end
  },
  { -- FZF
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local config = require("wacha.packer.configs.telescope")
      require("telescope").setup(config)
    end,
  },
  { -- Theme
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 999,
  },
}
