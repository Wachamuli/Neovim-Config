local settings = {}

settings.colorscheme = "nordic"

-- use :MasonInstall <language_server> if server isn't available
settings.lspservers = {
  ["lua_ls"] = {},
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

return settings
