-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Save, quit, and comment keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit neovim" })
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Comment line" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-q>", "<C-w><C-c>", { desc = "Close focused window" })

-- Add similar keybinds for navigating in terminal mode
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
vim.keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Move focus to the left window" })
vim.keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Move focus to the right window" })
vim.keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Move focus to the lower window" })
vim.keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Move focus to the upper window" })
vim.keymap.set("t", "<C-q>", "<Cmd>wincmd c<CR>", { desc = "Close focused window" })
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", { desc = "Start window command" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
