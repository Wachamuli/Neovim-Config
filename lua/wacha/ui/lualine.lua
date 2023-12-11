local function capitalize(str)
  return (str:gsub("^%l", string.upper))
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require('lualine').setup {
      options = {
        disabled_filetypes = { 'dashboard' },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            'branch',
            fmt = capitalize,
            icon = { '' }, -- 󰊢
            separator = { right = '', left = '' },
            padding = 0,
          },
        },
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            icon = "",
            separator = ' ',
            padding = 1,
            symbols = {
              modified = '', -- Text to show when the file is modified.
            },
          },
          {
            "diagnostics",
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ', other = ' 󰠠 ' },
            always_visible = true,
            colored = false,
            padding = 1,
            separator = ' ',
          },
        },
        lualine_x = {
          {

            "filetype",
            fmt = capitalize,
            separator = { left = '' },
          },
          {
            function()
              local msg = "No LSP"
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()

              if next(clients) == nil then
                return msg
              end

              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes

                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end

              return msg
            end,
            icon = " ",
            padding = 0,
            separator = ' ',
            fmt = capitalize
          },
          {
            function()
              local format = ""
              local all_formatters = require("conform").list_formatters(0)
              for _, formatter in ipairs(all_formatters) do
                format = formatter.name
              end
              return format
            end,
            separator = " ",
            fmt = capitalize

          },
          {
            'location',
            separator = { right = '' },
            icon = ""
          },
        },
        lualine_y = {
        },
        lualine_z = {},
      },
    }

    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })
  end,
}
