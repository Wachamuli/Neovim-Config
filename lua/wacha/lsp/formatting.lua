return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local formatters = require("wacha.settings").formatters
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = formatters
    })
    vim.keymap.set({ "n", "v" }, "gf", function()
      conform.format({
        async = true,
        timeout_ms = 500,
        lsp_fallback = true
      })
    end, { desc = "Format code" })
  end
}
