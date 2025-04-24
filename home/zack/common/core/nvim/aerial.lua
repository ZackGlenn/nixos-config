require("aerial").setup({
  on_attach = function(bufnr)
    vim.keymap.set("n", "<leader>ls", "<cmd>AerialToggle<CR>", { buffer = bufnr, desc = "Code outline" })
  end,
})
