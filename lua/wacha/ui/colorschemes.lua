local theme = require("wacha.settings").theme

return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    if theme == "onedark" then
      require("onedark").setup({ style = "darker" })
      require("onedark").load()
    end
  end
}
