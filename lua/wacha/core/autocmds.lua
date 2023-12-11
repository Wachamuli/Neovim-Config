local autocmd = vim.api.nvim_create_autocmd

-- Get rid of white spaces on save
autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(_)
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})
