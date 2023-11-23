local settings = {}

settings.lspservers = {
  ["lua_ls"] = {},
  ["rust_analyzer"] = {},
  ["pyright"] = {},
}
settings.treesitter = { "lua", "rust", "python" }

return settings
