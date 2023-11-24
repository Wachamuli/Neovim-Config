local settings = {}

require("onedark").load() -- onedark, tokyonight

-- use :MasonInstall <language_server> if server isn't available
settings.lspservers = {
  ["lua_ls"] = {}, -- server specific configuration goes here
  ["rust_analyzer"] = {},
  ["pyright"] = {},
  ["tsserver"] = {},
}

settings.treesitter = { "lua", "rust", "python", "typescript", }

settings.completion_icons = {
   Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = "󰉋 ",
    Function = "󰡱",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = "󰟢 ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
}

settings.diagnostic_signs = { Error = "", Warn = "", Hint = "", Info = "" }

return settings
