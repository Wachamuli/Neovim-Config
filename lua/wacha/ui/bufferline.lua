return {
  'akinsho/bufferline.nvim',
  event = "BufEnter",
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      highlights = {
        offset_separator = {
          fg = '#1E222A',
          bg = '#242933',
        },
      },
      options = {
        modified_icon = '●',
        close_icon = '',
        buffer_close_icon = '',
        diagnostics = "nvim_lsp",
        indicator = {
          style = 'none',
        },
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            highlight = "NvimTreeNormal",
            separator = true,
          }
        }
      }

    })
  end
}
