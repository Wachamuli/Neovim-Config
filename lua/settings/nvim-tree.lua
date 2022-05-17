local ok, nvimtree = pcall(require, "nvim-tree")

if not ok then
    return
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<Space>e", "<cmd>:NvimTreeToggle<CR>", opts)
-- nnoremap <leader>r :NvimTreeRefresh<CR>
-- nnoremap <leader>n :NvimTreeFindFile<CR>

vim.g.nvim_tree_special_files = {}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",

  git = {
    deleted = "",
    ignored = "◌",
    renamed = "➜",
    staged = "✓",
    unmerged = "",
    unstaged = "✗",
    untracked = "★",
  },

  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

nvimtree.setup {
  auto_reload_on_write = true,
  disable_netrw = true,
  sort_by = "name",
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
      enable = false,
      icons = {
        info = "",
        hint = "",
        error = "",
        warning = "",
      },
  },
  update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
  },
  system_open = {
      cmd = nil,
      args = {},
  },
  filters = {
      dotfiles = false,
      custom = {
          "^.git$",
      },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = "right",
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {},
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
        global = false,
    },
    open_file = {
        quit_on_open = true,
    },
  },
  renderer = {
    indent_markers = {
       enable = false,
    },
    icons = {
      webdev_colors = true,
    },
      --indent_markers = {
       --   enable = true,
         -- icons = {
          --    corner = "└ ",
           --   edge = "│ ",
            --  none = "  ",
          -- },
      -- },
  },
}

