local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  timeoutlen = 1000,

  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,

  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append("c")
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set fillchars+=vert:\ ]]
vim.cmd "set iskeyword+=-"
vim.cmd "colorscheme onenord"
vim.cmd "hi EndOfBuffer guibg=none"

for k, v in pairs(options) do
  vim.opt[k] = v
end

require("lualine").setup {
  options = {
    theme = 'onenord'
  }
}

require("nvim-web-devicons").set_icon {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
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
     icon = "﵂ ",
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
