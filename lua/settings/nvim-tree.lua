local ok, nvimtree = pcall(require, "nvim-tree")

if not ok then
  return
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<Space>e", "<cmd>:NvimTreeToggle<CR>", opts)
-- nnoremap <leader>r :NvimTreeRefresh<CR>
-- nnoremap <leader>n :NvimTreeFindFile<CR>

nvimtree.setup {
  renderer = {
    indent_markers = {
       enable = false,
    },
    icons = {
      webdev_colors = true,
      show = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
      },
      glyphs = {
        tree_icons = {
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
        },
      }
    }
  },
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
}

require("nvim-web-devicons").set_icon {
  zsh = {
    icon = "",
    name = "zsh"
  },
  c = {
     icon = "",
     name = "c",
  },
  css = {
     icon = "",
     name = "css",
  },
  deb = {
     icon = "",
     name = "deb",
  },
  Dockerfile = {
     icon = "",
     name = "Dockerfile",
  },
  html = {
     icon = "",
     name = "html",
  },
  js = {
     icon = "",
     name = "js",
  },
  lock = {
     icon = "",
     name = "lock",
  },
  mp3 = {
     icon = "",
     name = "mp3",
  },
  mp4 = {
     icon = "",
     name = "mp4",
  },
  out = {
     icon = "",
     name = "out",
  },
  ["robots.txt"] = {
     icon = "ﮧ",
     name = "robots",
  },
  toml = {
     icon = "",
     name = "toml",
  },
  ts = {
     icon = "ﯤ",
     name = "ts",
  },
  ttf = {
     icon = "",
     name = "TrueTypeFont",
  },
  rb = {
     icon = "",
     name = "rb",
  },
  rpm = {
     icon = "",
     name = "rpm",
  },
  vue = {
     icon = "﵂",
     name = "vue",
  },
  woff = {
     icon = "",
     name = "WebOpenFontFormat",
  },
  woff2 = {
     icon = "",
     name = "WebOpenFontFormat2",
  },
  xz = {
     icon = "",
     name = "xz",
  },
  zip = {
     icon = "",
     name = "zip",
  },
};
