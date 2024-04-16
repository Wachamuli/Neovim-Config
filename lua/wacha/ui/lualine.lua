local function capitalize(str)
  return (str:gsub("^%l", string.upper))
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require('lualine').setup {
      --  
      options = {
        disabled_filetypes = { 'dashboard' },
        globalstatus = true,
        section_separators = '',
        component_separators = '',
        separator = { left = '', right = ''}
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          {
            "branch",
            fmt = capitalize,
            icon = { '' }, -- 󰊢
            padding = 1,
          },
        },
        lualine_c = {
          {
            "diff",
            symbols = { added = ' ', modified = '󱎘 ', removed = ' ' },
            always_visible = true,
            colored = false,
            separator = { left = '' }
          },
          {
            "filename",
            icon = "",
            padding = 0,
            separator = { left = '' },
            symbols = {
              modified = '●', -- Text to show when the file is modified.
            },
          },
          {
            "diagnostics",
            sources = { 'nvim_diagnostic' },
            symbols = { error = '  ', warn = ' ', info = ' ', hint = ' ', other = ' 󰠠 ' },
            always_visible = true,
            colored = false,
            padding = 1,
          },
        },
        lualine_x = {
        },
        lualine_y = {
          {
            "filetype",
            fmt = capitalize,
            separator = { left = '' }
          },
          {
            function()
              local msg = "!LSP"
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
            fmt = capitalize,
            separator = { right = '' }
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
            fmt = capitalize,
            separator = { right = '' }
          },
        },
        lualine_z = {
          {
            'location',
            -- icon = ""
            -- separator = { left = '', right = '' }
          },
        },
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
