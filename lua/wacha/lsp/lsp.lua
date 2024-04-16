return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = "BufRead",
  dependencies = {
    { -- Language server installer
      "williamboman/mason.nvim",
      event = "User FileOpened",
      lazy = true,
      cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      build = ":MasonUpdate",
      config = function()
        require("mason").setup()
      end
    }
  },
  config = function()
    -- Setup language servers.
    local lspconfig = require("lspconfig")
    local lspservers = require("wacha.settings").lspservers
    local signs = require("wacha.settings").diagnostic_signs
    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }
    -- Server-specific settings. See `:help lspconfig-setup`
    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lvim.lsp.float)

    for name, config in pairs(lspservers) do
      config["handlers"] = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        -- ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
      }

      lspconfig[name].setup(config)
    end

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- vim.diagnostic.config({
    --   virtual_text = false, -- Turn off inline diagnostics
    -- })
    vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
      pattern = "*",
      group = "lsp_diagnostics_hold",
      callback = function()
        for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
          if vim.api.nvim_win_get_config(winid).zindex then
            return
          end
        end

        vim.diagnostic.open_float(0, {
          scope = "cursor",
          focusable = false,
          close_events = {
            "CursorMoved",
            "CursorMovedI",
            "BufHidden",
            "InsertCharPre",
            "WinLeave",
          },
        })
      end,
    })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition", buffer = ev.buf })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Show references" })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = ev.buf })
        vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { desc = "Rename symbol", buffer = ev.buf })
        vim.keymap.set('n', 'gk', vim.lsp.buf.hover, { desc = "Hover symbol", buffer = ev.buf })
        vim.keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, { desc = "Code action", buffer = ev.buf })

        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature help", buffer = ev.buf })
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        --vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Open d"})
        vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        vim.keymap.set('n', 'gq', vim.diagnostic.setloclist, { desc = "Show diagnostics" })

        --vim.keymap.set('n', '<leader>f', function()
        --vim.lsp.buf.format { async = true }
        --end, opts)
      end,
    })
  end
}
