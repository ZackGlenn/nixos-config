-- Better Around/Inside textobjects
require("mini.ai").setup({ n_lines = 500 })

-- Add/delete/replace surroundings (brackets, quotes, etc.)
require("mini.surround").setup()

-- File icons
require("mini.icons").setup()

-- File browser
require("mini.files").setup()
vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Open file browser" })

-- Autopairs
require("mini.pairs").setup()

-- Happier buffer removal
require("mini.bufremove").setup()

-- Start screen
require("mini.starter").setup()

-- Tabline
require("mini.tabline").setup()
vim.keymap.set("n", "H", "<cmd>bprev<CR>")
vim.keymap.set("n", "L", "<cmd>bnext<CR>")

-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require("mini.statusline")
-- set use_icons to true if you have a Nerd Font
statusline.setup({ use_icons = vim.g.have_nerd_font })

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return "%2l:%-2v"
end
