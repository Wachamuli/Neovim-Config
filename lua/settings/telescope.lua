local ok, telescope = pcall(require, "telescope")

if not ok then
    return
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Space>p", "<cmd>Telescope find_files<cr>", opts)

telescope.setup {
  picker = {
    hidden = false,
  },

  defaults = {
    prompt_title = false,
    results_title = false,

    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",

    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",

    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", ".git/", "dist/" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "absolute" },
    winblend = 0,
    border = {},
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" },

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--no-ignore",
      "--smart-case",
      "--hidden",
    },

    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.80,
      height = 0.85,
      preview_cutoff = 120,
    },

    mappings = {
      i = {
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
      },
      n = {
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
      },
    },

    borderchars = {
      { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      results = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    },
  },
}

