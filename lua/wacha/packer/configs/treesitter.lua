local languages = require("wacha.settings").treesitter

return {
  ensure_installed = { languages },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
}
