local ok, lualine = pcall(require, "lualine")

if not ok then
    return
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local function capitalize(filetype)
  local upperCharacter = string.upper(string.sub(filetype, 1, 1))
  local rest = string.sub(filetype, 2, string.len(filetype))
  local formatted = string.format("%s%s", upperCharacter, rest) 
  return formatted
end


local config = {
  options = {
    globalstatus = true,
    component_separators = "",
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
     --{ "mode", separator = { right = '' }},
    },
    lualine_b = {},
    lualine_c = { { "filename" }},
    lualine_x = { { "diff", symbols = { added = ' ', modified = ' ', removed = ' '} } },
    lualine_y = { {"branch", icon = "" }, {"location", icon = "" } },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},

    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local function ins_left_inactive(component)
  table.insert(config.inactive_sections.lualine_c, component)
end

local function ins_right_inactive(component)
  table.insert(config.inactive_sections.lualine_x, component)
end

ins_left {
  "filetype",
  fmt = capitalize,
  icons_enabled = true,
}

ins_left {
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
  cond = conditions.buffer_not_empty,
}

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

ins_left {
  function()
      return "%="
  end,
}

-- Add components to right sections
ins_right {
  function()
    return "" 
  end,
  cond = conditions.check_git_workspace,
  padding = 0,
}

-- Inactive
ins_left_inactive {
  function()
    return " "
  end,
  padding = { right = 0 },
}

ins_left_inactive {
  "filename",
  cond = conditions.buffer_not_empty,
}

lualine.setup(config)

