return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = { char = "▏" },
      scope = {
        highlight = "Normal",
        show_end = false,
      }
    })
  end
}
