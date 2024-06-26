return {
  "sindrets/diffview.nvim",
  lazy = true,
  cmd = "DiffviewOpen",
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<CR>" },
  },
  config = function()
    -- • `<leader>co`: Choose the OURS version of the conflict.
    -- • `<leader>ct`: Choose the THEIRS version of the conflict.
    local keymap = vim.keymap.set
    keymap("n", "<leader>gv", "<cmd>DiffviewOpen<CR>", { desc = "Open diff view" })
    keymap("n", "<leader>ga", "<cmd>DiffviewClose<CR>", { desc = "Close diff view" })
  end
}
