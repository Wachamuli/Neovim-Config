return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  cmd = "Gitsigns",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│", }, -- ┃
        change = { text = "│" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "" },
      },
    })

    local keymap = vim.keymap.set
    keymap("n", "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Show hunk inline" })
    keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Git blame" })
    keymap("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
    keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
  end
}
