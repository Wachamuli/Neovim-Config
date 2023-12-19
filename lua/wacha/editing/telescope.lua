return { -- FZF
  "nvim-telescope/telescope.nvim",
  lazy = true,
  event = "BufEnter",
  cmd = "Telescope",
  tag = "0.1.4",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    { "<leader>fc", "<cmd>Telescope colorscheme<CR>" },
    { "<leader>fg", "<cmd>Telescope git_commits<CR>" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Buffer list" })
    vim.keymap.set("n", "<leader>fg", telescope.git_commits, { desc = "Git commits" })
    vim.keymap.set("n", "<leader>fc", telescope.colorscheme, { desc = "Colorschemes" })

    require("telescope").setup({
      pickers = {
        find_files = {
          prompt_title = "Files",
          theme = "dropdown",
          preview = false,
          layout_config = {
            width = 0.46,
            height = 0.30,
          },
          borderchars = {
            prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
          },
        },
        buffers = {
          --prompt_title = false,
          theme = "dropdown",
          layout_config = {
            width = 0.46,
            height = 0.30,
          },
          borderchars = {
            prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
          },
        },
        git_commits = {
          preview = true,
        },
      },
      defaults = {
        preview = false,
        results_title = false,
        prompt_prefix = "   ", -- " "
        selection_caret = "󱞩 ", --  󱞩
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        set_env = { ["COLORTERM"] = "truecolor" },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        path_display = function(_, path)
          local tl_utils = require("telescope.utils")
          local tl_entry_display = require("telescope.pickers.entry_display")

          local bufferNameTail = tl_utils.path_tail(path)
          local remaining_path = require('plenary.strings').truncate(path, #path - #bufferNameTail, '')
          local tail = bufferNameTail .. " "

          local displayer = tl_entry_display.create({
            separator = ' ',
            items = {
              { width = 20 },
              { width = 45 },
            },
          })
          return displayer({
            { tail },
            { remaining_path, "TelescopeResultsComment" },
          })
        end,
      },
    })
  end,
}
