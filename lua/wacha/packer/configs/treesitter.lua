local languages = require("wacha.settings").treesitter

return {
  ensure_installed = { languages },
  sync_install = false,
  highlight= { enable = true },
  indent = { enable = true },
}
