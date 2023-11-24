local settings = {}

require("tokyonight").load() -- onedark, tokyonight

-- use :MasonInstall <language_server> if server isn't available
settings.lspservers = {
  ["lua_ls"] = {}, -- server specific configuration goes here
  ["rust_analyzer"] = {},
  ["pyright"] = {},
  ["tsserver"] = {},
}

settings.treesitter = { "lua", "rust", "python", "typescript", }

settings.completion_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = " ",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = " ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

settings.diagnostic_signs = { Error = "", Warn = "", Hint = "", Info = "" }

return settings
