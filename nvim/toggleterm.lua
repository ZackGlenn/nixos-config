require("toggleterm").setup({ open_mapping = "<leader>tf" })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _Lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })
