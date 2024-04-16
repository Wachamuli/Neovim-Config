local theme = require("wacha.settings").theme

return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if theme == "onedark" then
        require("onedark").setup({ style = "darker" })
        require("onedark").load()
      end
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local catppuccin = require("catppuccin")
      if theme == "catppuccin" then
        catppuccin.setup({
          -- flavour = "frappe", -- latte, frappe, macchiato, mocha
          custom_highlights = function(colors)
            return {
              MiniClueDescSingle = { bg = colors.base },
              MiniClueDescGroup = { bg = colors.base },
              MiniClueNextKey = { bg = colors.base }
            }
          end
        })

        catppuccin.load()
      end
    end
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local nordic = require("nordic")
      if theme == "nordic" then
        nordic.setup({
          override = {
            TelescopePromptBorder = { bg = "#242933", fg = "#FFFFFF" },
            TelescopeResultsBorder = { bg = "#242933", fg = "#FFFFFF" },
            TelescopeResultsNormal = { bg = "#242933" },
            TelescopePromptNormal = { bg = "#242933" },
            TelescopePromptTitle = { bg = "#242933", fg = "#c5727a" },

            MiniClueBorder = { bg = "#242933", fg = "#FFFFFF" },
            MiniClueDescSingle = { bg = "#242933" },
            MiniClueDescGroup = { bg = "#242933", fg = "#ebcb8b" },
            MiniClueNextKey = { bg = "#242933", fg = "#a3be8c" }
          }
        })

        nordic.load()
      end
    end
  }
}
