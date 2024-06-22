local theme = require("wacha.settings").theme

return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if theme == "onedark" then
        require("onedark").setup({
          style = "darker",
          highlights = {
            MiniClueBorder = { bg = "#1f2329", fg = "#FFFFFF" },
            MiniClueDescSingle = { bg = "#1f2329" },
            MiniClueDescGroup = { bg = "#1f2329", fg = "#ebcb8b" },
            MiniClueNextKey = { bg = "#1f2329", fg = "#a3be8c" }
          }
        })
        require("onedark").load()
      end
    end
  },
}
