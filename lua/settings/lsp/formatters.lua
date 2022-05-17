require("formatter").setup({
  filetype = {
    python = {
      function()
        return {
          exe = "python3 -m autopep8",
          args = {
            "--in-place", 
            "--aggressive", 
            "--aggressive",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = false
        }
      end
    },
    css = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote"},
          stdin = true
        }
      end
    },
    html = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote"},
          stdin = true
        }
      end
    }
  }
})

