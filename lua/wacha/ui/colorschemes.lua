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
          }
        })

        require("nordic").load()
      end
    end
  }
}
