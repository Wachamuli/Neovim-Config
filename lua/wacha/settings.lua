local settings = {}

-- use :MasonInstall <language_server> if server isn't available
settings.lspservers = {
  ["lua_ls"] = {},
  ["rust_analyzer"] = {},
  ["pyright"] = {},
}
settings.treesitter = { "lua", "rust", "python" }

return settings
