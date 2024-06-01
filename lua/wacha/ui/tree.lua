return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
      config = function()
        local options = { override = require("wacha.settings").icons }
        require("nvim-web-devicons").setup(options)
      end
    },
  },
  config = function()
    -- Nvim-Tree.lua advises to do this at the start.
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    keymap("n", "<C-b>", "<cmd>:NvimTreeToggle<CR>", opts)
    --keymap("n", "<C-r>r", "<cmd>:NvimTreeRefresh<CR>", opts)
    --keymap("n", "<leader>n", "<cmd>:NvimTreeFindFile<CR>", opts)

    local icons = {
      git_placement = 'after',
      modified_placement = 'after',
      padding = ' ',
      glyphs = {
        default = '󰈔',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = ' ',
          open = ' ',
          empty = ' ',
          empty_open = ' ',
          symlink = '󰉒 ',
          symlink_open = '󰉒 ',
        },
        git = {
          unstaged = "✚",
          staged = "●",
          unmerged = "",
          renamed = "»",
          untracked = "…",
          deleted = "✖",
          ignored = "◌",
        },

      },
    }
    local renderer = {
      root_folder_label = function(path)
        local segments = {}
        for segment in path:gmatch("[^/\\]+") do
          segments[#segments + 1] = segment
        end

        return segments[#segments] or path
      end,
      indent_width = 2,
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = { corner = '╰' },
      },
      icons = icons,
    }

    local view = {
      cursorline = false,
      signcolumn = "yes",
      width = { min = 28 },
      side = "left",
    }

    local function on_attach(bufnr)
      local api = require 'nvim-tree.api'
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      vim.keymap.set('n', '<C-k>', '', { buffer = bufnr })
      vim.keymap.set('n', 'i', api.node.show_info_popup, opts 'Info')
      vim.keymap.set('n', '[', api.tree.change_root_to_parent, opts 'Up')
      vim.keymap.set('n', ']', api.tree.change_root_to_node, opts 'CD')
      vim.keymap.set('n', '<Tab>', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', 'o', api.node.run.system, opts 'Run System')
      vim.keymap.set('n', 'a', api.fs.create, { buffer = bufnr })
      vim.keymap.set('n', 'd', api.fs.remove, { buffer = bufnr })
      vim.keymap.set('n', 'x', api.fs.cut, opts 'Cut')
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts 'Copy Name')
      vim.keymap.set('n', 'p', api.fs.paste, opts 'Paste')
      vim.keymap.set('n', 'c', api.fs.copy.node, opts 'Copy')
      vim.keymap.set('n', 'r', api.fs.rename, opts 'Rename')
      vim.keymap.set('n', 'W', api.tree.collapse_all, opts 'Collapse')
      vim.keymap.set('n', 'E', api.tree.expand_all, opts 'Expand All')
    end

    require('nvim-tree').setup {
      hijack_cursor = true,
      sync_root_with_cwd = true,
      view = view,
      renderer = renderer,
      git = { ignore = false },
      diagnostics = { enable = true },
      on_attach = on_attach,
    }
  end,
}
