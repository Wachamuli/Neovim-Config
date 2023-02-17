local fterm = require("FTerm")

vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- local gitui = fterm:new({
--   ft = 'fterm_gitui', -- You can also override the default filetype, if you want
--   cmd = "gitui",
--   dimensions = {
--     height = 0.9,
--     width = 0.9
--   }
-- })
--
-- function _G.__fterm_gitui()
--   gitui:toggle()
-- end
-- vim.keymap.set('n', '<C-e>', '<CMD>lua gitui:toggle()<CR>')
