return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    local formatters = require("wacha.settings").formatters
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = formatters
    })
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({
        async = false,
        timeout_ms = 500,
        lsp_fallback = true
      })
    end)
  end
}