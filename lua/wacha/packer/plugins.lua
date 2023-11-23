return {
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
  { -- Theme
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nordic").load()
    end
  }
}
