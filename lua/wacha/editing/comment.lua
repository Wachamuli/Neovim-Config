return {
  "echasnovski/mini.comment",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("mini.comment").setup({
      mappings = {
        comment = ',',
        comment_line = ',',
        comment_visual = ',',
        textobject = ',',
      },
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    })
  end,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
}
