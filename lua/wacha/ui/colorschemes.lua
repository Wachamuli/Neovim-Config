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
      if theme == "catppuccin" then
        require("catppuccin").load()
      end
    end
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if theme == "nordic" then
        require("nordic").setup({
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

        require("nordic").load()
      end
    end
  }
}
