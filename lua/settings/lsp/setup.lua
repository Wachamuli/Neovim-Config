local servers = { "pyright", "rust_analyzer", "tsserver", "omnisharp" }

require("nvim-lsp-installer").setup({
  automatic_installation = true,
  ui = {
    icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
    }
  }
})

local function lsp_keymaps(bufnr)
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_set_keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_set_keymap("n", "gx", "<cmd>Trouble document_diagnostics<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
end

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end
end

local function show_diagnostic_on_hover(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup show_diagnostic_on_hover 
          autocmd CursorHold * lua vim.diagnostic.open_float()
        augroup END
      ]],
      false
    )
  end
end

local formatting_callback = function(client, bufnr)
  vim.keymap.set('n', '<leader>f', function()
    if client.name == "pyright" then
      vim.cmd "Format"
      return
    end
    local util = require("vim.lsp.util")
    local params = util.make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr)
  end, {buffer = bufnr})
end

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = function(client, bufnr)
      lsp_keymaps(bufnr)
      formatting_callback(client, bufnr)
      lsp_highlight_document(client)
      show_diagnostic_on_hover(client)
      require("lsp_signature").on_attach()
    end,
    flags = { debounce_text_changes = 150 }
  }
end

