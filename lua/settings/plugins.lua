-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function()
  use "wbthomason/packer.nvim"
  
  -- Themes
  use {
    "rmehri01/onenord.nvim",
    "navarasu/onedark.nvim",
  }

  -- LSP stuff
  use {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "ray-x/lsp_signature.nvim",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  }

  -- Utils
  use {
    "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
    "mhartington/formatter.nvim",
  }

  use {
    "lukas-reineke/indent-blankline.nvim", config = require "settings.indent",
    "lewis6991/gitsigns.nvim",
    "windwp/nvim-autopairs",
    "rcarriga/nvim-notify",
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
  }
  
  -- Navigation and Status
  use {
    "nvim-telescope/telescope.nvim",
    "nvim-lualine/lualine.nvim",
    "kyazdani42/nvim-tree.lua",
    "akinsho/bufferline.nvim", tag = "v2.*",
    "numToStr/FTerm.nvim",
  }

  -- Dependencies
  use {
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/plenary.nvim"
  }
end)

