return { -- FZF
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<C-p>", "<cmd>Telescope find_files<CR>" }
  },
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    local tl_utils = require("telescope.utils")
    local tl_entry_display = require("telescope.pickers.entry_display")

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
    vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)

    require("telescope").setup({
      defaults = {
        preview = false,
        results_title = false,
        prompt_prefix = "   ", -- " "
        selection_caret = "󱞩 ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        --borderchars = {
        -- prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        --results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        --},
        set_env = { ["COLORTERM"] = "truecolor" },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        --file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        --grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        --qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        --requireselection_caret = "  ",
        path_display = function(_, path)
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
      pickers = {
        find_files = {
          prompt_title = false,
          theme = "dropdown",
          layout_config = {
            width = 0.46,
            height = 0.30,
          },
        }
      }
    })
  end,
}
