return {
  "echasnovski/mini.clue",
  event = "VeryLazy",
  version = "*",
  config = function()
    local miniclue = require("mini.clue")
    require("mini.clue").setup({
      triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },

      clues = {
        { mode = 'n', keys = '<Leader>f', desc = "+Telescope" },
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        -- miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        --miniclue.gen_clues.g(),
      },

      window = {
        config = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        }
      }
    })
  end
}